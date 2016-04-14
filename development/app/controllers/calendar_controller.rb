class CalendarController < ApplicationController
include CalendarHelper

def view
  @events = Event.all
end

end
