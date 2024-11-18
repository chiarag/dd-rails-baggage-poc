class MultiplyController < ApplicationController
  def multiply
    request.headers.each do |key, value|
      logger.info "Header #{key}: #{value}"
    end

    Datadog::Tracing.trace('multiply') do |span|
      # Access custom tags from the trace
      lost_bag = span.get_tag('lost_bag')
      logger.info "Baggage Tag lost_bag: #{lost_bag}"
    end

    random = rand(1..9)
    logger.info "Random is #{random}"
    value = params[:value].to_i
    logger.info "Value is #{value}"
    render json: random * value

  end

end
