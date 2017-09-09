class DailyPost
  HASH_TAG = '#cryptostatus_daily'

  attr_reader :provider, :image

  def self.call(args)
    new(*args).call
  end

  def initialize(provider)
    data = Social::DataBuilder.call
    @image = Image::Generate.call data
    @provider = provider
  end

  def call
    send provider, image
    Image::Destroy.call(image)
  end

  private

  def twitter(image)
    Social::Twitter::Post.call(message: HASH_TAG, photo_path: image.path)
  end

  def facebook(image)
    # Social::Facebook::Post.call(title: HASH_TAG, photo_path: image.path)
  end
end
