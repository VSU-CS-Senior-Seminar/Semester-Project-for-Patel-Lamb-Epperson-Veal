class ReputationsController < ApplicationController

  def upvote
    user = User.find(params[:id])
    if (Posts_Disliked.all.where(:post_id => params[:pid], :user_id => current_user.id).count(:all) == 1)
      Posts_Disliked.where(:post_id => params[:pid], :user_id => current_user.id).destroy_all
      user.update_attribute(:reputation, user.reputation+1)
    else
      #nothing
    end

    if (Posts_Liked.all.where(:post_id => params[:pid], :user_id => current_user.id).count(:all) == 1)
      Posts_Liked.where(:post_id => params[:pid], :user_id => current_user.id).destroy_all
      user.update_attribute(:reputation, user.reputation-1)
      respond_to do |format|
        format.html { redirect_to(:back) }
      end
    else
      likedpost = Posts_Liked.new
      likedpost.post_id = params[:pid]
      likedpost.user_id = current_user.id
      likedpost.save
    #  if (user.id != current_user.id)
        user.update_attribute(:reputation, user.reputation+1)
    #  else
    #  end
      respond_to do |format|
        format.html { redirect_to(:back) }
      end
    end
  end

  def downvote
    user = User.find(params[:id])
    if (Posts_Liked.all.where(:post_id => params[:pid], :user_id => current_user.id).count(:all) == 1)
      Posts_Liked.where(:post_id => params[:pid], :user_id => current_user.id).destroy_all
      user.update_attribute(:reputation, user.reputation-1)
    else
    end

    if (Posts_Disliked.all.where(:post_id => params[:pid], :user_id => current_user.id).count(:all) == 1)
      Posts_Disliked.where(:post_id => params[:pid], :user_id => current_user.id).destroy_all
      user.update_attribute(:reputation, user.reputation+1)
      respond_to do |format|
        format.html { redirect_to(:back) }
      end
    else
      dislikedpost = Posts_Disliked.new
      dislikedpost.post_id = params[:pid]
      dislikedpost.user_id = current_user.id
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

end
