module Image
  class Generate
    attr_reader :path, :font_size, :font_family, :text_coords

    def self.call(*args)
      new(*args).call
    end

    def initialize(options)
      @path = options[:path]
      @font_size = options[:font_size]
      @font_family = options[:font_family]
      @text_coords = options[:text_coords] || {}
    end

    def call
      generated_image = generate_image(path)
      insert_text(generated_image)
      generated_image
    end

    private

    def generate_image(path)
      template = MiniMagick::Image.open(path)

      new_path = generate_name(path)
      template.write(new_path)

      MiniMagick::Image.new(new_path)
    end

    def insert_text(generated_image)
      generated_image.combine_options do |image|
        image.font(font_family)
        image.pointsize(font_size)
        text_coords.each do |text, data|
          image.fill(data[1])
          image.draw "text #{data[0]} '#{text}'"
        end
      end
    end

    def generate_name(path)
      time_mark = Time.now.strftime('%Y%m%d%M%S')
      path.gsub(/.(jpg|png)\z/, "_#{time_mark}\\0")
    end
  end
end
