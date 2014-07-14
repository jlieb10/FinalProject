class MyDevise::SessionsController < Devise::SessionsController
    def create
      self.resource = warden.authenticate!(auth_options)
      set_flash_message(:notice, :signed_in) if is_flashing_format?
      sign_in(resource_name, resource)
      yield resource if block_given?
      if resource.latest_hunt
        redirect_to resource.latest_hunt
      else
        redirect_to new_hunt_path
      end
    end

end

