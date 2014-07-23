class MyDevise::SessionsController < Devise::SessionsController
  before_action :check_referer, only: [:new]

  # GET /resource/sign_in
  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    respond_with(resource, serialize_options(resource))
    session['craigslist_url'] = request.referer if request.referer
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
    yield resource if block_given?
    redirect_to(redirect_helper)
  end

  def redirect_helper
    if session['craigslist_url']
      path = session['craigslist_url']
    else
      if resource.latest_hunt
        path = resource.latest_hunt
      else
        path = new_hunt_path
      end
    end
    return path
  end

  private
    def check_referer
      url = request.referrer
      host = Addressable::URI.parse(url).host
      if !host.match("craigslist.org")
        redirect_to url
      end
    end

end

