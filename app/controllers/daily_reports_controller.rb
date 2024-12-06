class DailyReportsController < ApplicationController
  def index
    @daily_reports = DailyReport.default_order
  end

  def show
    @tasks = Task.default_order
  end

  def create
    @daily_report = current_user.daily_reports.create!
    redirect_to daily_report_path(@daily_report)
  end
end
