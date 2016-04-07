class AdministratesController < ApplicationController
  def approve
    user = User.find(params[:id])
    user.update_attribute(:approved, true)
    respond_to do |format|
      format.html { redirect_to(forem.admin_root_url) }
    end
  end


end
