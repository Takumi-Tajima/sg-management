class DailyReportsController < ApplicationController
  def index
    @daily_reports = DailyReport.default_order
  end

  def show
    @tasks = Task.default_order
  end

  def create
    @daily_report = DailyReport.new
  end
end
