class Activity < ActiveRecord::Base
  searchkick
  belongs_to :user

  validates_presence_of :event_name
  validates_presence_of :event_location
  validates_presence_of :event_description
  validates_presence_of :event_site
  validates_presence_of :event_date
  validates_presence_of :event_time

end
