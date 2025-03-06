require 'rails_helper'

describe UsersController, type: :request do
    before do
      # Create multiple users
      FactoryBot.create_list(:user, 12)
    end

  describe "GET /users" do
    it "returns a list of users" do
      get users_path # get "/users"
      expect(response).to have_http_status(200)
      expect(response.body).to eq(User.all.to_json)
      # expect(response.body.length).to eq(12) # failing says 2752
    end
  end

  describe "GET /users/:id" do
    it "returns a specific user" do
      user = User.first
      get "/users/#{user.id}"
      expect(response.status).to eq(200)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /users" do
    it "creates a new user" do
      post "/users", params: { user: { email: "e@mail.com", password: "password" } } 
      expect(response).to have_http_status(201)
      expect(response).to have_http_status(:created)
      expect(User.last.created_at).not_to be_nil
    end
  end
end