class CurrenctyPostService
  def self.call(args)
    new(*args).call
  end

  def initialize(provider)
    @data = FeatchDate.new
    @image = GenerateImage.new @data
    @provider = provider
  end

  def call
    send @provider, @image
    ImageCleaner.call(@image)
  end

  private

  def twitter

  end

  def facebook
    Social::Twitter::CreateTweet.call()
  end
end
