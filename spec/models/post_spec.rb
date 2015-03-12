require 'rails_helper'

RSpec.describe Post, :type => :model do

  let(:post) { FactoryGirl.create :post }

  describe "validates presence of post title" do
    it { should validate_presence_of(:title) }
  end

  describe "validates presence of post content" do
    it { should validate_presence_of(:content) }
  end


end
