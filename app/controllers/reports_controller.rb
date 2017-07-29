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
            @target = nil
            @type = nil
            if @report.game_id != nil
                @target = Game.find(@report.game_id)
                @type = "Game"
            elsif @report.ad_id != nil
                @target = Ad.find(@report.ad_id)
                @type = "Ad"
            elsif @report.review_id != nil
                @target = Review.find(@report.review_id)
                @type = "Review"
            end
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
        debug = "out of if"
        if params[:game_target] != nil
            debug = "if game"
            target = Game.find(params[:game_target])
        elsif params[:ad_target] != nil
            debug = "if ad"
            target = Ad.find(params[:ad_target])
        elsif params[:review_target] != nil
            debug = "if review"
            target = Review.find(params[:review_target])
        end
        debug = debug + " '" + params[:game_target].to_s + "',"
        debug = debug + "'" + params[:ad_target].to_s + "',"
        debug = debug + "'" + params[:review_target].to_s + "' "

        if (current_user == nil || current_user.role != "Admin")
            flash[:warning] = "How did you even get here?"
            redirect_to games_path
        else
            if user_id && (target != nil)
                @report = Report.new(report_params)
                user_id.reports << @report
                target.reports << @report
                @report.save
                flash[:warning] = "Report sent succesfully"
                redirect_to games_path
            else
                if user_id
                    flash[:warning] = "FUKKIN TARGET: "+debug+"//"+params.inspect
                else
                    flash[:warning] = "REGISTER YOU FOOL"
                end
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
