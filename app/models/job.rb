class Job < ActiveRecord::Base
  searchkick
  belongs_to :user

  validates_presence_of :job_title
  validates_presence_of :company
  validates_presence_of :location
  validates_presence_of :job_type
  validates_presence_of :contact
  validates_presence_of :description
  
end
