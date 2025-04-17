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
        puts "Hits the SHOW Action"
        render json: @user, status: :ok
    end

    def new # displays the user create form
        @user = User.new()
    end

    def create
        # user_params
        @user = User.new(allowed_user_params)
        if @user.save
            flash[:notice] = "User created successfully"
            render json: @user, status: :created
        else
            flash.now[:error] = "User creation failed" # is this the right way to do it?
            render :new
            raise @user.errors.inspect
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit
        end
    end

    def delete
        @user = User.find(params[:id])
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password) # this is the older way of doing it and has security flaws, but it still works
    end

    def allowed_user_params
        params.expect(user: [:name, :email, :password])
    end
end
