class RegistrationsController < Devise::RegistrationsController

  def create
    super
    if(User.where(:neighborhood_id => resource.neighborhood_id).count(:all) == 1)
      resource.update_attribute(:approved, true)
      resource.update_attribute(:forem_admin, true)
      resource.update_attribute(:confirmed_at, Time.now)
    else

    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:fname, :mname, :lname, :nickname,:address, :city, :zip, :email, :neighborhood_id, :password, :password_confirmation, :current_password)
  end

  def account_update_params
    params.require(:user).permit(:fname, :mname, :lname, :nickname,:address, :city, :zip, :email, :password, :password_confirmation, :current_password)
  end
end
