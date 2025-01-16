class UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users
        # Other rendering options:
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
        render json: @user
    end

    def new # what is the point of this action 
        @user = User.new
    end

    def create
        # filter params so only allowed attributes are passed
        user_params
        # create new object
        @user = User.new(params[:user])
        # save object
        if @user.save
        # if succeeeds redirect to index
            redirect_to users_path
        # if fails render new
        else
            render :new
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to users_path(@user)
        else
            render :edit
    end

    def delete
        @user = User.find(params[:id])
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect :users_path
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
