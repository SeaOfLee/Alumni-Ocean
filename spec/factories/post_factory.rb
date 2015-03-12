FactoryGirl.define do

  factory :post do
    title "Post title 3"
    content  "The most interesting post you've ever read."

    initialize_with { new(title, content) }
  end
end
