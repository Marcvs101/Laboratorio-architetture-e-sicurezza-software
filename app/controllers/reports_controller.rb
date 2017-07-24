class ReportsController < ApplicationController
    def index
        @reports = Report.all
    end

    def show
        @report = Report.find(params[:id])
        @from = User.find(@report.user_id)
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

        @report = Report.new(report_params)
        user_id.reports << @report
        if target
            target.reports << @report
        end
        @report.save
        redirect_to @report
    end

    def destroy
        @report = Report.find(params[:id])
        @report.destroy
        redirect_to reports_path
    end

    private
        def report_params
            params.require(:report).permit(:description)
        end
end
