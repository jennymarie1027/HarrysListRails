class UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users
        # Other rendering approaches:
        # render json: @users, only: [:name, :email]           # Only specific attributes
        # render json: @users, except: [:password_digest]      # All attributes except these
        # render json: @users, include: :posts                 # Include associated models

        # Combined it would be:
        # render json: @users, 
        #   include: {posts: {only: [:title, :content]}}, 
        #   except: [:password_digest],
        #   status: :ok
    end  
  
    def show
        @user = User.find(params[:id])
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    def delete
    end

    def destroy
    end
end
