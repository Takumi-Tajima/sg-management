class DailyReportsController < ApplicationController
  before_action :set_daily_report, only: %i[show]
  def index
    @daily_reports = DailyReport.where(user_id: current_user.id).default_order
  end

  def show
    @tasks = Task.where(daily_report_id: @daily_report.id)
  end

  def create
    @daily_report = current_user.daily_reports.create!
    redirect_to daily_report_path(@daily_report)
  end

  private

  def set_daily_report
    @daily_report = DailyReport.find(params[:id])
  end
end
