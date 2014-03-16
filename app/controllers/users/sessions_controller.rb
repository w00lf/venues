class Users::SessionsController < Devise::SessionsController
  before_filter :authenticate_admin!
  before_filter :check_admin

  def check_admin
    redirect_to new_admin_session_path unless current_admin
  end
end