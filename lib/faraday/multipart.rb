# frozen_string_literal: true

require_relative 'multipart/file_part'
require_relative 'multipart/param_part'
require_relative 'multipart/middleware'
require_relative 'multipart/version'

require 'multipart/post/version'

module Faraday
  # Main Faraday::Multipart module.
  module Multipart
    MULTIPART_POST_VERSION = ::Gem::Version.new(::Multipart::Post::VERSION)

    Faraday::Request.register_middleware(multipart: Faraday::Multipart::Middleware)
  end

  # Aliases for Faraday v1, these are all deprecated and will be removed in v2 of this middleware
  FilePart = Multipart::FilePart
  ParamPart = Multipart::ParamPart
  Parts = Multipart::Parts
  CompositeReadIO = Multipart::CompositeReadIO
  # multipart-post v2.2.0 introduces a new class hierarchy for classes like Parts and UploadIO
  # For backwards compatibility, detect the gem version and use the right class
  UploadIO = if ::Gem::Requirement.new('>= 2.2.0').satisfied_by?(Multipart::MULTIPART_POST_VERSION)
               ::Multipart::Post::UploadIO
             else
               ::UploadIO
             end
end
