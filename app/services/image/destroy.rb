module Image
  class Destroy
    def self.call(*args)
      new(*args).call
    end

    def initialize(image)
      File.delete(image)
    end
  end
end
