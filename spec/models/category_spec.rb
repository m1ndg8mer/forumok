require 'rails_helper'

RSpec.describe Category, :type => :model do

  it "has a valid factory" do
    FactoryGirl.create(:category).should be_valid
  end
  it "is invalid without a title" do
    FactoryGirl.build(:category, title: nil).should_not be_valid
  end
  it "is invalid without a body" do
    FactoryGirl.build(:category, body: nil).should_not be_valid
  end
  
end