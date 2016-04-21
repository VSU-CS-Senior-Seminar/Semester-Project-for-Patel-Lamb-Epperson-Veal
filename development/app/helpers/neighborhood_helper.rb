module NeighborhoodHelper

def createSubForums(newForum)
  newSubOne = Forem::Forum.new
  newSubOne.title = "General Discussion"
  newSubOne.description = "Off topic community discussion goes here."
  newSubOne.category_id = newForum.id
    newSubOne.position = 0
  newSubOne.save

  newSubTwo = Forem::Forum.new
  newSubTwo.title = "Lost"
  newSubTwo.description = "Lost something? Post about it here."
  newSubTwo.category_id = newForum.id
    newSubTwo.position = 1
  newSubTwo.save

  newSubThree = Forem::Forum.new
  newSubThree.title = "Found"
  newSubThree.description = "Found something? Post about it here."
  newSubThree.category_id = newForum.id
    newSubThree.position = 2
  newSubThree.save

  newSubFour = Forem::Forum.new
  newSubFour.title = "For Sale"
  newSubFour.description = "Sell items to your community here."
  newSubFour.category_id = newForum.id
    newSubFour.position = 3
  newSubFour.save

  newSubFive = Forem::Forum.new
  newSubFive.title = "Business"
    newSubFive.description = "Talk about local businesses here."
  newSubFive.category_id = newForum.id
    newSubFive.position = 4
  newSubFive.save
end


end
