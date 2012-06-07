module SessionsHelper

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    current_user = user
  end

  def sign_out
    cookies.delete(:remember_token)
    current_user = nil
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def is_admin?
    current_user.admin? if signed_in?
  end

  def deny_access
    redirect_to root_path
  end
end
