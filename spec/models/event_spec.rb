require 'rails_helper'

RSpec.describe Event, :type => :model do


  let(:event) { FactoryGirl.create :user }

  describe "validates presence of event_name" do
    it { should validate_presence_of(:event_name) }
  end

   describe "validates presence of event_location" do
    it { should validate_presence_of(:event_location) }
  end

  describe "validates presence of event_description" do
    it { should validate_presence_of(:event_description) }
  end

  describe "validates presence of event_site" do
    it { should validate_presence_of(:event_site) }
  end

  describe "validates presence of event_date" do
    it { should validate_presence_of(:event_date) }
  end

  describe "validates presence of event_time" do
    it { should validate_presence_of(:event_time) }
  end

end
