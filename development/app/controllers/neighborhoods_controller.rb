class NeighborhoodsController < ApplicationController
  before_action only: [:show, :edit, :create, :destroy]
  include NeighborhoodHelper
  def new
    @neighborhood = Neighborhood.new
    @neighborhoods = Neighborhood.all
  end
  def index
    @neighborhoods = Neighborhood.all
  end
  def create
    @neighborhood = Neighborhood.new(hood_params)
    respond_to do |format|
      if @neighborhood.save
        newForum = Forem::Category.new
        newForum.name = @neighborhood.zip
        newForum.position = 0
        newForum.save
        createSubForums (newForum)
        format.html { redirect_to(new_registration_path(:user)) }
      else
        format.html { redirect_to new_registration_path(:user), notice: "Duplicate neighborhood, try again!" }
        format.json { render json: @neighborhood.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def hood_params
    params.require(:neighborhood).permit(:name,:zip,:latitude,:longitude)
  end
end
