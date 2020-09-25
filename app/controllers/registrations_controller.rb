class RegistrationsController < Devise::RegistrationsController
  #require 'net/smtp'
  
  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :login, :email, :password, :password_confirmation, :how, :orientation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :login, :email, :password, :password_confirmation, :current_password)
  end

  protected

  def after_inactive_sign_up_path_for(resource)
    super(resource)
    #UserMailer.welcome(resource).deliver_now
    '/basic_pages/29' 
  end

end

