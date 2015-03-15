class Activity < ActiveRecord::Base
  searchkick word_middle: [:event_name, :event_location, :event_description, :event_site]
  belongs_to :user

  validates_presence_of :event_name
  validates_presence_of :event_location
  validates_presence_of :event_description
  validates_presence_of :event_site
  validates_presence_of :event_date
  validates_presence_of :event_time

end
