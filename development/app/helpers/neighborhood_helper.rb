module NeighborhoodHelper

def createSubForums(newForum)
  newSubOne = Forem::Forum.new
  newSubOne.title = "General Discussion"
  newSubOne.description = "Off topic community discussion goes here."
  newSubOne.category_id = newForum.id
  newSubOne.save

  newSubTwo = Forem::Forum.new
  newSubTwo.title = "Lost"
  newSubTwo.description = "Lost something? Post about it here!"
  newSubTwo.category_id = newForum.id
  newSubTwo.save

  newSubThree = Forem::Forum.new
  newSubThree.title = "Found"
  newSubThree.description = "Found something? Post about it here!"
  newSubThree.category_id = newForum.id
  newSubThree.save

  newSubFour = Forem::Forum.new
  newSubFour.title = "For Sale"
  newSubFour.description = "Sell items to your community here!"
  newSubFour.category_id = newForum.id
  newSubFour.save

  newSubFive = Forem::Forum.new
  newSubFive.title = "Events"
  newSubFive.description = "Post about any upcoming community events here."
  newSubFive.category_id = newForum.id
  newSubFive.save
end


end
