module SocialNetworksServices
  module Facebook
    class Base
      def self.call(*args)
        new(*args).call
      end

      private

      def facebook
        @facebook ||= ::Koala::Facebook::API.new(ENV['FACEBOOK_ACCESS_TOKEN'])
      end
    end
  end
end
