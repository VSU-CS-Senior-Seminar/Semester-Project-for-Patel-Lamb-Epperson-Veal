class Neighborhood < ActiveRecord::Base
  geocoded_by :zip
  after_validation :geocode
  validates :name, :uniqueness => { message: "There can only be one community with the same name!" }
end
