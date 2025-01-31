require 'rails_helper'

RSpec.describe User, type: :model do
  describe "POST" do
    it "creates a user" do
      user = FactoryBot.create(:user)
      expect(user).to be_valid
      expect(user.email).to include("rspec_test_user")
    end

    it "creates an invalid user" do
      invalid_user = FactoryBot.create(:invalid_user)
      expect(invalid_user).to be_invalid
    end
  end
end

# Rspec.describe InvalidUser, type: :model do
 
# end
