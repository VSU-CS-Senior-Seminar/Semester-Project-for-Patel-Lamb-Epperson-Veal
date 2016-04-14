class AdministratesController < ApplicationController
  def approve
    user = User.find(params[:id])
    user.update_attribute(:approved, true)
    user.update_attribute(:confirmed_at, Time.now)
    respond_to do |format|
      format.html { redirect_to(forem.admin_root_url) }
    end
  end


end
