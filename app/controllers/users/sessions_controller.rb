class Users::SessionsController < Devise::SessionsController
  before_filter :authenticate_admin!
  before_filter :check_admin

  def check_admin
    exit unless current_admin
  end
end