module Social
  module Facebook
    class CreatePost
      attr_reader :title, :name, :description, :photo_path

      def initialize(options = {})
        @title = options[:title]
        @name = options[:name]
        @description = options[:description]
        @photo_path = options[:photo_path]
      end

      def call
        client.put_picture(File.open('test.jpg'), message: title)
      end

      def client
        @client ||= Client.call
      end
    end
  end
end
