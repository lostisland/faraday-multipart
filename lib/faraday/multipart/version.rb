# frozen_string_literal: true

module Faraday
  module Multipart
    VERSION = '1.0.3'
    begin
      require 'multipart/post/version'
      MULTIPART_POST_VERSION = ::Gem::Version.new(::Multipart::Post::VERSION)
    rescue LoadError
      require 'multipart_post'
      MULTIPART_POST_VERSION = ::Gem::Version.new(::MultipartPost::VERSION)
    end
  end
end
