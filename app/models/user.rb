require 'bcrypt'
class User < ActiveRecord::Base
  searchkick
  has_secure_password
  has_many :comments
  has_many :posts
  has_many :jobs
  has_many :events

  validates :first_name, :last_name, :password, :password_confirmation, :current_location, :program_attended, :campus, :cohort, :bio, :avatar, :presence => true

  def validation
    errors[:base] << "All fields must be filled out in form."
  end
  # validates_presence_of :last_name
  # validates_presence_of :email
  # validates_presence_of :password
  validates_uniqueness_of :email
  validates :email, confirmation: true
  VALID_EMAIL_REGEX = /\A[a-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\z/
  validates :email, format: { with: VALID_EMAIL_REGEX }



  has_attached_file :avatar, :styles => {
    :medium => "300x300>",
    :thumb => "100x100>"
  }

  validates_attachment_content_type :avatar, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
