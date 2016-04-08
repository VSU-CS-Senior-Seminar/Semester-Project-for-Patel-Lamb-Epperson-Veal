class ReputationsController < ApplicationController
  def upvote
    user = User.find(params[:id])
    if (user.id != current_user.id)
      user.update_attribute(:reputation, user.reputation+1)
    else
    end
    respond_to do |format|
      format.html { redirect_to(:back) }
    end
  end


end
