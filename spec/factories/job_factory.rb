FactoryGirl.define do

  factory :job do
    job_title "CTO"
    company  "Apple"
    location "Los Angeles, CA"
    job_type "Part-Time"
    contact "johhny@apple.com"
    description "The most awesome job. Ever."

    initialize_with { new(job_title, company, location, job_type, contact, description) }
  end
end
