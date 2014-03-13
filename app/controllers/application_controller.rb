class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_admin!
  # before_filter :check_user_creditinals, only: [:new, :create]

  # # def check_user_creditinals
  # #   redirect_to(edit_user_registration_path, notice: 'You need to suply your email or telephone!') if current_user.invalid_contacts?
  # # end
end
