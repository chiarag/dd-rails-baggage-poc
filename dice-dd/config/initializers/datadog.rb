# frozen_string_literal: true
require 'ddtrace'

Datadog.configure do |c|
  # Instrument Rails
  c.tracing.instrument :rails

  # Optionally instrument other components (e.g., ActiveRecord, Redis, HTTP)
  c.tracing.instrument :http
end
