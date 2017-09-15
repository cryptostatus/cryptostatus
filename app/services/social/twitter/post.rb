module Social
  module Twitter
    class Post
      attr_reader :message, :photo

      def self.call(*args)
        new(*args).call
      end

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
