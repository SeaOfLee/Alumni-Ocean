class Job < ActiveRecord::Base
  searchkick word_middle: [:company, :location, :description, :contact, :job_type, :job_title]
  belongs_to :user

  validates_presence_of :job_title
  validates_presence_of :company
  validates_presence_of :location
  validates_presence_of :job_type
  validates_presence_of :contact
  validates_presence_of :description
  
end
