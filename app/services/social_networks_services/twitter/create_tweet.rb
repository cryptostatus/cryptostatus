module SocialNetworksServices
  module Twitter
    class CreateTweet < SocialNetworksServices::Twitter::Base
      attr_reader :message, :photo

      def initialize(options = {})
        @message = options[:message]
        @photo = File.open(options[:photo_path])
      end

      def call
        twitter.update_with_media(message, photo)
      end
    end
  end
end
