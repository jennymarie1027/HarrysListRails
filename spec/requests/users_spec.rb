require 'rails_helper'

describe UsersController do # , type: :request
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
      get user_path(user.id) #"/users/#{user.id}"
      expect(response.status).to eq(200)
      expect(response).to have_http_status(:success)
      expect(response.body).to eq(user.to_json)
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

  describe "PUT /users/:id" do
    it "edits a user" do
      user = User.first
      put "/users/#{user.id}", params: { user: { email: "edited@mail.com" } }
      expect(response).to have_http_status(302)
      expect(response).to have_http_status(:found)
      expect(User.first.email).to eq("edited@mail.com")
    end
  end

  describe "DELETE /users/:id" do
    it "deletes a user" do
      user = User.first
      expect(User.count).to eq(12)
      delete "/users/#{user.id}"
      expect(response).to have_http_status(302)
      expect(response).to have_http_status(:found)
      expect(User.count).to eq(11)
    end
  end
end