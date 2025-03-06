require 'rails_helper'

# describe UsersController do
#   describe "Get #index" do


#     it "returns a successful response" do
#       get :index
#       expect(response.status).to eq(200)
#       expect(JSON.parse(response.body).length).to eq(12)
#     end
#   end
# end

describe "Users", type: :request do
      before do
      # Create multiple users
      FactoryBot.create_list(:user, 12)
    end
  describe "GET /users" do
    it "returns a successful response" do
      get users_path # get "/users"
      expect(response).to have_http_status(200)
      expect(response.body).to eq(User.all.to_json)
      # expect(response.body.length).to eq(12) # failing says 2752
    end
  end

  describe 

  # describe "POST /users" do
  #   it "creates a new user" do
  #     post "/users", params: { user: { name: "Test User", email: "" } } 
  #     expect(response).to have_http_status(201)
  #   end

end