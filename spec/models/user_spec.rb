require 'rails_helper'

RSpec.describe User, type: :model do

  before :each do
    @user = User.new(
      name:"Alice",
      email: "test@test.com",
      password: "123456",
      password_confirmation: "123456"
    )
  end

  it 'is valid when all properties are present' do
    expect(@user).to be_valid
  end
  it 'is valid if authetication is confirmed' do
    expect(@user.authenticate("123456")).to be(@user)
  end
  it 'returns false if property :password and :password_confirmation are present and different in User table' do
    @user.password_confirmation = "124556"
    expect(@user).not_to be_valid
  end
  it 'returns false if property :password and :password_confirmation are present and different in User table' do
    expect(@user.authenticate("12556")).to be(false)
  end
  it 'returns false if property :email is present and not unique in User table' do
    @user.save
    user2 = User.new(name:"Alton", password: "654321", password_confirmation: "654321", email: "test@test.com")
    expect(user2.save).to be(false)
  end
end
