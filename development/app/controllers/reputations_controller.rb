class ReputationsController < ApplicationController

  def upvote
    user = User.find(params[:id])
    if (Posts_Disliked.all.where(:post_id => params[:pid], :user_id => user.id).count(:all) == 1)
      Posts_Disliked.where(:post_id => params[:pid], :user_id => user.id).destroy_all
      user.update_attribute(:reputation, user.reputation+1)
    else
    end
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
    if (Posts_Liked.all.where(:post_id => params[:pid], :user_id => user.id).count(:all) == 1)
      Posts_Liked.where(:post_id => params[:pid], :user_id => user.id).destroy_all
      user.update_attribute(:reputation, user.reputation-1)
    else
    end
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
