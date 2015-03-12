require 'rails_helper'

RSpec.describe Job, :type => :model do

  let(:job) { FactoryGirl.create :user }

  describe "validates presence of  job_title" do
    it { should validate_presence_of(:job_title) }
  end

  describe "validates presence of company" do
    it { should validate_presence_of(:company) }
  end

  describe "validates presence of location" do
    it { should validate_presence_of(:location) }
  end

  describe "validates presence of contact" do
    it { should validate_presence_of(:contact) }
  end

  describe "validates presence of job_type" do
    it { should validate_presence_of(:job_type) }
  end

  describe "validates presence of description" do
    it { should validate_presence_of(:description) }
  end

  end
