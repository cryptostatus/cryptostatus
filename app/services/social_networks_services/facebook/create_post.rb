module SocialNetworksServices
  module Facebook
    class CreatePost < SocialNetworksServices::Facebook::Base
      attr_reader :title, :name, :description, :photo_path

      def initialize(options = {})
        @title = options[:title]
        @name = options[:name]
        @description = options[:description]
        @photo_path = options[:photo_path]
      end

      def call
        facebook.put_picture(File.open('test.jpg'), message: title)
      end
    end
  end
end
