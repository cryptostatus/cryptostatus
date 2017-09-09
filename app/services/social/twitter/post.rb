module Social
  module Twitter
    class CreateTweet
      attr_reader :message, :photo

      def initialize(options = {})
        @message = options[:message]
        @photo = File.open(options[:photo_path])
      end

      def call
        client.update_with_media(message, photo)
      end

      def client
        @client ||= Client.call
      end
    end
  end
end
