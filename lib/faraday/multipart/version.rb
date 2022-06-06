# frozen_string_literal: true

require 'multipart/post/version'

module Faraday
  module Multipart
    VERSION = '1.0.3'
    MULTIPART_POST_VERSION = ::Gem::Version.new(::Multipart::Post::VERSION)
  end
end
