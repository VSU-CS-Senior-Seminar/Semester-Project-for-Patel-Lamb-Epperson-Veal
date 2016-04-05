Forem::ForumsController.class_eval do

  def index
    @categories = Forem::Category.where(:name => current_user.neighborhood_id)
  end

end
