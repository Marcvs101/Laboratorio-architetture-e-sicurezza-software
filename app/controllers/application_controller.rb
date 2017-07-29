class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    protected
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    protected
    def check_access(user,minimum_role)
        @return = {status: false, message: "Incorrect parameters, please contact a developer."}
        @rolemap = {nil => 1, "Banned" => 0, "Active" => 2, "Admin" => 3}
        if user
            user_role = user.role
        else
            user_role = nil
        end
        if !(minimum_role && @rolemap[user_role] && @rolemap[minimum_role])
            return @return
        end
        if (@rolemap[user_role]>=@rolemap[minimum_role])
            @return = {status: true, message: "Access granted."}
        else
            @return = {status: false, message: "Insufficient permissions."}
        end
        return @return
    end
    helper_method :check_access
end
