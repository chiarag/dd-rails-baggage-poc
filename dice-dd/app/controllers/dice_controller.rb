require 'net/http'

class DiceController < ApplicationController
  def roll
    Datadog::Tracing.trace('rails.request') do |span|
      span.set_tag('lost_bag','where is it?')
      logger.info "lost_bag: #{span.get_tag('lost_bag')}"

      roll = rand(1..6).to_s

      url = URI.parse("http://localhost:5010/multiply/#{roll}")
      http = Net::HTTP.new(url.host, url.port)
      request = Net::HTTP::Post.new(url.request_uri)

      response = http.request(request)

      # lost_bag tag is not visible in x-datadog-tag headers
      request.each_header do |key, value|
        logger.info "Header #{key}: #{value}"
      end

      data = JSON.parse(response.body)

      render json: data
    end
  end
end