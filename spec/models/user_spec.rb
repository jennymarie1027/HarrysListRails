require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) } # set up test data

  describe "validations" do
    it "creates a user" do
      expect(user).to be_valid
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
      model3 = FactoryBot.create(:user, email: 'zebra@example.com')
      model2 = FactoryBot.create(:user, email: 'apple@example.com')
      model1 = FactoryBot.create(:user, email: 'banana@example.com')

      expect(User.alphabetical).to eq([model2, model1, model3])

    end
   
  end
  describe 'callbacks' do
    it 'logs created user' do
      expect(user).to receive(:log_created_user)
      user.save
    end

    # it 'logs updated user' do
    #   expect(user).to receive(:log_updated_user)
    #   user.save
    #   user.updated_at = Time.now
    # end

    it 'logs saved user' do
      expect(user).to receive(:log_saved_user)
      user.save
    end
  end
end

# Rspec.describe InvalidUser, type: :model do
 
# end
