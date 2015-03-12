require 'rails_helper'

RSpec.describe User, :type => :model do
  # before(:each)  do
  #   @valid_user = User.create(
  #     :first_name => "Lee",
  #     :last_name => "Person",
  #     :email => "lee@lee.com",
  #     :password => "123"
  #   )
  #
  #   @invalid_user = User.create(
  #     :first_name => " ",
  #     :last_name => "Person",
  #     :email => "person@person.com",
  #     :password => "123"
  #   )
  # end

  let(:user) { FactoryGirl.create :user }

  describe "validates presence of  first_name" do
    it { should validate_presence_of(:first_name) }
  end

  describe "validates presence of last_name" do
    it { should validate_presence_of(:last_name) }
  end

  describe "validates presence of email" do
    it { should validate_presence_of(:email) }
  end

  describe "validates presence of password" do
    it { should validate_presence_of(:password) }
  end

  describe "validates uniqueness_of_email" do
    it { should validate_uniqueness_of(:email) }
  end

  describe "invalidates invalid email" do
    it { should_not allow_value("test@test").for(:email) }
  end

  describe "validates valid email" do
    it { should allow_value("test@test.com").for(:email) }
  end
  
end
