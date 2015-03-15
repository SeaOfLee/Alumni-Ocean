FactoryGirl.define do

  # By default factory girl assumes the :cat symbol refers to a Cat class
  #it believes you likely defined in app/models/cat.rb
  factory :user do
    first_name "bob"
    last_name  "siamese"
    email "bob@siamese.com"
    password "password123"
    password_confirmation "password123"
    current_location "Santa Monica"
    program_attended "WDI"
    campus "Atlanta"
    cohort "14"
    bio "Arg"
    avatar_file_name "AsianSalad_Square.png"
    avatar_content_type "image/png"
    avatar_file_size 1013175

    initialize_with { new(first_name, last_name, email, password, password_confirmation, current_location, program_attended, campus, cohort, bio, avatar_file_name, ) }
  end
end
