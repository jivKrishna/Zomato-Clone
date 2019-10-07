module ApplicationHelper

  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    !!current_user
  end

  def is_admin?
    if current_user != nil
      current_user.admin
    else
      false
    end
  end

  def authenticate_user!
    redirect_to root_path("#loginAccountModal") unless signed_in?
  end

  def authenticate_admin!
    redirect_to admin_registration_path unless is_admin? 
  end

  def redirection_path
    if is_admin?
      redirect_to current_user
    else
      redirect_to root_path
    end
  end

end
