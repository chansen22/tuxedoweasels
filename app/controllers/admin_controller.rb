class AdminController < ApplicationController
  before_filter :authenticate
  before_filter :admin_user

  def index
    @title = "Admin Portal Index"
  end

  private
  
    def authenticate
      deny_access unless signed_in?
    end

    def admin_user
      redirect_to(root_path) unless is_admin?
    end
end
