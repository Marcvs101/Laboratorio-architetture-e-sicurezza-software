class ReportsController < ApplicationController
    def index
        if (current_user == nil || current_user.role != "Admin")
            flash[:warning] = "How did you even get here?"
            redirect_to games_path
        else
            @reports = Report.all
        end
    end

    def show
        if (current_user && current_user.role == "Admin")
            @report = Report.find(params[:id])
            @from = User.find(@report.user_id)
        else
            flash[:warning] = "How did you even get here?"
            redirect_to games_path
        end
    end

    def new
    end

    def create
        user_id = current_user
        target = nil
        if params[:game_id]
            target = Game.find(params[:game_id])
        elsif params[:ad_id]
            target = Ad.find(params[:ad_id])
        elsif params[:review_id]
            target = Review.find(params[:review_id])
        end

        if (current_user == nil || current_user.role != "Admin")
            flash[:warning] = "How did you even get here?"
            redirect_to games_path
        else
            if user_id && target
                @report = Report.new(report_params)
                user_id.reports << @report
                target.reports << @report
                @report.save
                flash[:warning] = "Report sent succesfully"
                redirect_to games_path
            else
                flash[:warning] = "Something went wrong"
                redirect_to games_path
            end
        end
    end

    def destroy
        if (current_user == nil || current_user.role != "Admin")
            flash[:warning] = "How did you even get here?"
            redirect_to games_path
        else
            @report = Report.find(params[:id])
            @report.destroy
            redirect_to reports_path
        end
    end

    private
        def report_params
            params.require(:report).permit(:description)
        end
end
