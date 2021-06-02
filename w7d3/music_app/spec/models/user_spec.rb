require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    FactoryBot.build(:user,
      email: "oranges@best.com",
      password: "password"
    )
  end

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(6)}
  end

  describe "#is_password?" do
    it "when a password is correct returns true" do
      expect(user.is_password?("password")).to be true
    end

    it "when a password is incorrect returns false" do
      expect(user.is_password?("banana")).to be false
    end
  end

  describe "#reset_session_token!" do
    it "sets a new session token for the user" do
      user.valid?
      prev_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).to_not eq(old_session_token)
    end
  end

  describle "::find_by_credentials" do
    it "expects to find a user given correct attributes" do
      expect(User.find_by_credentials("orange@best.com", "password")).to eq(user)
    end

    it "expects to return nil when given wrong attributes" do
      expect(User.find_by_credentials("orange@best.com", "banana")).to eq(nil)
    end
  end

end