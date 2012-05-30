require 'spec_helper'

describe "user" do

  before(:each) do
    User.all.destroy
  end

  it "create#" do
    user = FactoryGirl.build(:user)
    expect {
      user.save
    }.to change(User, :count).by(1)
  end

  describe "validations" do
    it "should be valid" do
      FactoryGirl.build(:user).should be_valid
    end

    it "should require username" do
      user = FactoryGirl.build(:user)
      user.username = nil
      user.should_not be_valid
    end
  end

  it "should return url" do
    user = FactoryGirl.build(:user)
    user.id = 1
    user.url.should == "/users/1"
  end
end
