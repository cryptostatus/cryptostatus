module Social
  module Facebook
    class Post
      attr_reader :title, :photo

      def self.call(*args)
        new(*args).call
      end

      def initialize(options = {})
        @title = options[:title]
        @photo = File.open(options[:photo_path])
      end

      def call
        client.put_picture(photo, message: title)
      end

      def client
        @client ||= Client.call
      end
    end
  end
end
