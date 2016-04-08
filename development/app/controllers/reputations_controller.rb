class ReputationsController < ApplicationController
  def upvote
    user = User.find(params[:id])
    user.update_attribute(:reputation, user.reputation+1)
    respond_to do |format|
      format.html { redirect_to(:back) }
    end
  end


end
