require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) } # set up test data
  let(:model3) { FactoryBot.build(:user, email: 'zebra@example.com') }
  let(:model2) { FactoryBot.build(:user, email: 'apple@example.com') }
  let(:model1) { FactoryBot.build(:user, email: 'banana@example.com') }

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

  describe 'scopes' do

    it 'returns users in alphabetical order' do
      # create test records with emails in non-alphabetical order
      # model3 = 
      # model2 = FactoryBot.build(:user, email: 'apple@example.com')
      # model1 = FactoryBot.build(:user, email: 'banana@example.com')

      # model1.save
      # model2.save
      # model3.save

      # expect(User.alphabetical).to eq([model2, model1, model3])
      puts model1.inspect
    end
  end
end

# Rspec.describe InvalidUser, type: :model do
 
# end
