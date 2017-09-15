module Image
  class Destroy
    def self.call(image)
      File.delete(image.path)
    end
  end
end
