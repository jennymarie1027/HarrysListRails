require 'rails_helper'

RSpec.describe User, type: :model do
  describe "POST" do
    it "creates a user" do
      user = FactoryBot.create(:user)
      expect(user).to be_valid
      expect(:status).to eq(201)
    end
  end
end
