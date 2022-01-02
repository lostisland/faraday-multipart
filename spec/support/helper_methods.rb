# frozen_string_literal: true

require 'multipart_parser/reader'

module Faraday
  module Multipart
    module HelperMethods
      def multipart_file
        Faraday::Multipart::FilePart.new(__FILE__, 'text/x-ruby')
      end

      # parse boundary out of a Content-Type header like:
      #   Content-Type: multipart/form-data; boundary=gc0p4Jq0M2Yt08jU534c0p
      def parse_multipart_boundary(ctype)
        MultipartParser::Reader.extract_boundary_value(ctype)
      end

      # parse a multipart MIME message, returning a hash of any multipart errors
      def parse_multipart(boundary, body)
        reader = MultipartParser::Reader.new(boundary)
        result = { errors: [], parts: [] }

        def result.part(name)
          hash = self[:parts].detect { |h| h[:part].name == name }
          [hash[:part], hash[:body].join]
        end

        reader.on_part do |part|
          result[:parts] << thispart = {
            part: part,
            body: []
          }
          part.on_data do |chunk|
            thispart[:body] << chunk
          end
        end
        reader.on_error do |msg|
          result[:errors] << msg
        end
        reader.write(body)
        result
      end
    end
  end
end
