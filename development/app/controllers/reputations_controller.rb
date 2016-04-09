class ReputationsController < ApplicationController

  def upvote
    user = User.find(params[:id])
    likedpost = Posts_Liked.new
    likedpost.post_id = params[:pid]
    likedpost.user_id = user.id
    likedpost.save
  #  if (user.id != current_user.id)
      user.update_attribute(:reputation, user.reputation+1)
  #  else
  #  end
    respond_to do |format|
      format.html { redirect_to(:back) }
    end
  end

  def downvote
    user = User.find(params[:id])
    dislikedpost = Posts_Disliked.new
    dislikedpost.post_id = params[:pid]
    dislikedpost.user_id = user.id
    dislikedpost.save
  #  if (user.id != current_user.id)
      user.update_attribute(:reputation, user.reputation-1)
  #  else
  #  end
    respond_to do |format|
      format.html { redirect_to(:back) }
    end
  end

end