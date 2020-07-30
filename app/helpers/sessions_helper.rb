module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def current_pet
    @current_pet ||= Pet.find_by(params[:id])
  end

  def logged_in?
    !!current_user
  end
end
