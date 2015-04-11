require "rack/secure/referer/version"
require 'rack/request'

module Rack
  module Secure
    module Referer
      def new(env)
        unless env['HTTP_REFERER'].nil? || env['HTTP_REFERER'].match(/\Ahttp(s)?:\/\//i)
          env['HTTP_REFERER'] = nil
        end
        super
      end
    end
  end
end

Rack::Request.extend Rack::Secure::Referer
