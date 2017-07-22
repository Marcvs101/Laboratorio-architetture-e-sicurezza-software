class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def new
    end

    def create
        @user = User.new(user_params)
        @user.save
        redirect_to @user
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path
    end

    private
        def user_params
            params.require(:user).permit(:name, :lastname, :email, :role, :password, :password_confirmation)
        end
end
