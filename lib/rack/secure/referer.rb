require "rack/secure/referer/version"
require 'rack/request'

module Rack
  module Secure
    module Referer
      def initialize(env, *_)
        if !env['HTTP_REFERER'].nil? && !env['HTTP_REFERER'].match(/\Ahttp(s)?:\/\//i)
          env['HTTP_REFERER'] = nil
        end
        super
      end
    end
  end
end

Rack::Request.prepend Rack::Secure::Referer
