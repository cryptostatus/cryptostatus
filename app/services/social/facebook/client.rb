module Social
  module Facebook
    class Client
      def self.call
        ::Koala::Facebook::API.new(ENV['FACEBOOK_ACCESS_TOKEN'])
      end
    end
  end
end
