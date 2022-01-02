# frozen_string_literal: true

require 'faraday'
require_relative 'multipart/file_part'
require_relative 'multipart/param_part'
require_relative 'multipart/middleware'
require_relative 'multipart/version'

module Faraday
  # Main Faraday::Multipart module.
  module Multipart
    Faraday::Request.register_middleware(multipart: Faraday::Multipart::Middleware)
  end
end
