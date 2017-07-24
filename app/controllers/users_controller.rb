class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def new
    end

    def edit
        @user = User.find(params[:id])
        user_actual = current_user
        if (user_actual == nil)
            flash[:warning] = "How did you even get here?"
            redirect_to games_path
        end
    end

    def update
        @user = User.find(params[:id])
        user_actual = current_user
        if (user_actual == nil)
            flash[:warning] = "How did you even get here?"
            redirect_to games_path
        else
            if (params[:user][:role] == nil)
                params[:user][:role] = @user.role
            end
            @user.update_attributes!(user_params)
            redirect_to @user
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path
    end

    private
    def user_params
        params.require(:user).permit(:provider, :uid, :name, :oauthtoken, :oauthexpiresat, :email, :role)
    end
end
