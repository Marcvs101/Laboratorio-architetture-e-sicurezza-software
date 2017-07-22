class ReportsController < ApplicationController
    def show
        @report = Report.find(params[:id])
    end

    def new
    end

    def create
        @report = Report.new(report_params)

        @report.save
        redirect_to @report
    end

    private
        def report_params
            params.require(:report).permit(:description)
        end
end
