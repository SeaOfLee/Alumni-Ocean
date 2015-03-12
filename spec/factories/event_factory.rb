FactoryGirl.define do

  factory :event do
    event_name "WDI Fair"
    event_location "Santa Monica, CA"
    event_description "Job fair for recent graduates."
    event_site "WDI Santa Monica Campus"
    event_date "April 10, 2015"
    event_time "7:00PM PST"

    initialize_with { new(event_name, event_location, event_description, event_site, event_date, event_time) }
  end
end
