require 'omniauth'
module OmniAuth
  module Strategies
    class Xrono < OmniAuth::Strategies::OAuth2
      option :name, :xrono

      option :client_options, {
        :site => ENV["XRONO_OAUTH_URL"] || "http://xrono.isotope11.com",
        :authorize_url => "/oauth/authorize"
      }
      uid { raw_info["email"] }

      info do
        {
          :email => raw_info["email"]
          # and anything else you want to return to your API consumers
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/me.json').parsed
      end
    end
  end
end
