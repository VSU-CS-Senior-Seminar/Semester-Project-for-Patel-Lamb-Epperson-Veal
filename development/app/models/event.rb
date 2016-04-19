class Event < ActiveRecord::Base
	belongs_to :user, :foreign_key => :user_id, class_name: 'User'
	
	def neighborhood_id
		user.neighborhood_id
	end
end
