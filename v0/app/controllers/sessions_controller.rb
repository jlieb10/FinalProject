class Sessions_Controller < Devise::SessionsController

  def create
    super
    if current_user.hunts == nil
      redirect_to new_hunt_path
    else
      redirect_to hunt_path(current_user.hunts.last.id)
    end
  end
end
