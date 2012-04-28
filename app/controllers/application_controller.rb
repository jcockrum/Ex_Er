class ApplicationController < ActionController::Base
  include ControllerAuthentication
  protect_from_forgery
  
  before_filter :load_sidebar
  helper :all 
  helper_method :admin?, :has_access?
  
private  
  
  def load_sidebar
    @exercises = Exercise.all
    @events = Event.all
  end
  
  def admin?
    current_user.is_admin == true
  end
  
  def has_access?(resource_user_id)
    if 
      resource_user_id == current_user.id
      return true
    else  
      return admin?
    end
  end
  
  def authorize
    unless admin?
      flash.now[:alert] = "Not authorized for this action."
      redirect_to home_path
      false
    end
  end
  
end