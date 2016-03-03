class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:fname, :mname, :lname, :nickname,:address, :city, :zip, :email, :neighborhood_id, :password, :password_confirmation, :current_password)
  end

  def account_update_params
    params.require(:user).permit(:fname, :mname, :lname, :nickname,:address, :city, :zip, :email, :password, :password_confirmation, :current_password)
  end
end
