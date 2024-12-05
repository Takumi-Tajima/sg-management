class DailyReports::RetrospectivesController < ApplicationController
  before_action :set_task, only: %i[new]
  before_action :set_daily_report, only: %i[new create]
  before_action :set_retrospective, only: %i[show]
  def show
  end

  def new
    @retrospective = @task.retrospectives.build
  end

  def create
    task = Task.find(params[:retrospective][:task_id])
    @retrospective = task.retrospectives.build(retrospective_params)

    if @retrospective.save
      redirect_to daily_report_path(@daily_report), notice: t('controllers.common.created', model: '振り返り')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def retrospective_params
    params.require(:retrospective).permit(%i[task_id fact fact_detail potential try])
  end

  def set_retrospective
    @retrospective = Retrospective.find(params[:id])
  end

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_daily_report
    @daily_report = DailyReport.find(params[:daily_report_id])
  end
end
