class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
      if resource.is_a?(User) 
        blogs_path
      else
        super
      end
  end
  def after_sign_up_path_for(resource)
    stored_location_for(resource) ||
      if resource.is_a?(User) 
        blogs_path
      else
        super
      end
  end
end
