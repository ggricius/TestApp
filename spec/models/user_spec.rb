require 'rails_helper'

describe Product do
  before do
    @user = FakeUser.build(:user)
  end
  it "is not valid" do
    expect(User.new(first_name: "")).not_to be_valid
  end
end
