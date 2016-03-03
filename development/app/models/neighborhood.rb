class Neighborhood < ActiveRecord::Base
  validates :name, :uniqueness => { message: "There can only be one community with the same name!" }
end
