class UsersController < ApplicationController
    def index
        @users = User.all
        user_actual = current_user
        if (user_actual == nil || user_actual.role != "Admin")
            flash[:warning] = "How did you even get here?"
            redirect_to games_path
        end
    end

    def show
        if (current_user && current_user.role == "Admin")
            @user = User.find(params[:id])
        else
            flash[:warning] = "How did you even get here?"
            redirect_to games_path
        end
    end

    def new
    end

    def edit
        @user = User.find(params[:id])
        user_actual = current_user
        if (user_actual == nil || user_actual.role != "Admin")
            flash[:warning] = "How did you even get here?"
            redirect_to games_path
        end
    end

    def update
        @user = User.find(params[:id])
        user_actual = current_user
        if (user_actual == nil || user_actual.role != "Admin")
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
        user_actual = current_user
        if (user_actual == nil || user_actual.role != "Admin")
            flash[:warning] = "How did you even get here?"
            redirect_to games_path
        else
            @user.destroy
            redirect_to users_path
        end
    end

    private
    def user_params
        params.require(:user).permit(:provider, :uid, :name, :oauthtoken, :oauthexpiresat, :email, :role)
    end
end
