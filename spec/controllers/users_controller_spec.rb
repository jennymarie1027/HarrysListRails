require 'rails_helper'
require 'spec_helper'

describe UsersController do
  describe "Get #index" do
    before do
      # Create multiple users
      FactoryBot.create_list(:user, 12)
    end

    it "returns a successful response" do
      get :index
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body).length).to eq(12)
    end
  end
end
