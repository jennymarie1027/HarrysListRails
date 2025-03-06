require 'rails_helper'

describe PostsController do
    before do
        # Create multiple posts
        FactoryBot.create_list(:post, 1) # errors out if list is more than one item
        FactoryBot.create_list(:user, 1)
      end

    describe "GET /posts" do
        it "returns a list of posts" do
            get "/posts" # posts_path
            expect(response).to have_http_status(200)
            expect(response.body).to eq(Post.all.to_json)
            puts response.body
        end
    end

    describe "GET /posts/:id" do
        it "gets a post by id" do
            post = Post.first
            get "/posts/#{post.id}"
            expect(response).to have_http_status(200)
            expect(response.body).to eq(post.to_json)
        end
    end

    describe "POST /posts" do
        it "creates a post" do
            user = User.first
            post "/posts", params: { post: { user_id: user.id, title: "test post", price: 500, category: "Furniture", description: "test description", image: "https://images.unsplash.com/photo-1731412924028-204b15ca8f1d?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", file: "file", location: "Denver", is_fave: false } }
            expect(response).to have_http_status(201)
            expect(response).to have_http_status(:created)
            expect(Post.last.created_at).not_to be_nil
        end
    end

    describe "PUT /posts/:id" do
        it "edits a post" do
            post = Post.first
            put "/posts/#{post.id}", params: { post: { title: "edited post" } }
            expect(response).to have_http_status(200)
            expect(response).to have_http_status(:ok)
            expect(Post.first.title).to eq("edited post")
            puts response.body
        end
    end
    
    describe "DELETE /posts/:id" do
        it "deletes a post" do
            post = Post.first
            expect(Post.count).to eq(1)
            delete "/posts/#{post.id}"
            expect(response).to have_http_status(204)
            expect(response).to have_http_status(:no_content)
            expect(Post.count).to eq(0)
        end
    end
end