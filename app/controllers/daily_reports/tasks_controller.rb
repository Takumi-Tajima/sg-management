class DailyReports::TasksController < ApplicationController
  before_action :set_daily_report
  def new
    @task = @daily_report.tasks.build
  end

  def create
    @task = @daily_report.tasks.build(task_params)

    if @task.save
      redirect_to daily_report_path(@daily_report), notice: t('controllers.common.created', model: 'タスク')
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_daily_report
    @daily_report = DailyReport.find(params[:daily_report_id])
  end

  def task_params
    params.require(:task).permit(%i[name])
  end
end
