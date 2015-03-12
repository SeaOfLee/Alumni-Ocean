FactoryGirl.define do

  # By default factory girl assumes the :cat symbol refers to a Cat class
  #it believes you likely defined in app/models/cat.rb
  factory :user do
    first_name "bob"
    last_name  "siamese"
    email "bob@siamese.com"
    password "password123"

    initialize_with { new(first_name, last_name, email) }
  end
end
