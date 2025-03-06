require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) } # set up test data

  describe "validations" do
    it "creates a user" do
      expect(user).to be_valid
      expect(user.email).to include("rspec_test_user")
    end

    it "is not valid without a email" do
      user.email = nil
      expect(user).not_to be_valid
    end

    it "is not valid without a password" do
      user.password = nil
      expect(user).not_to be_valid
    end

    it "it not valid with duplicate email" do
      existing_user = FactoryBot.create(:user)
      duplicate_user = FactoryBot.build(:user, email: existing_user.email)
      expect(duplicate_user).not_to be_valid
    end

    it "is not valid with a blank password" do
      user.password_digest = " "
      expect(user).not_to be_valid
    end

    it 'is not valid with an incorrectly formatted email' do
      invalid_emails = ['invalid_email', 'no_at_sign.com']
      invalid_emails.each do |invalid_email|
        user.email = invalid_email
        expect(user).not_to be_valid
      end
    end

  end
end

# Rspec.describe InvalidUser, type: :model do
 
# end
