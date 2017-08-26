module Redirect
  def redirect_to_with_params(url, get_params)
    new_url = URI(url)
    new_url.query = URI.encode_www_form(get_params)
    redirect_to new_url.to_s
  end
end
