module MailerHelper
  def url_with_params(url, get_params)
    url = URI(url)
    url.query = URI.encode_www_form(get_params)
    url.to_s
  end
end
