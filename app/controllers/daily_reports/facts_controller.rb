class DailyReports::FactsController < ApplicationController
  before_action :set_task, only: %i[new]
  before_action :set_daily_report, only: %i[show new create]
  before_action :set_fact, only: %i[show]

  def show
    @retrospective = Retrospective.find_by(fact_id: @fact.id)
    @messages = Message.where(fact_id: @fact.id)
  end

  def new
    @fact = @task.facts.build
  end

  def create
    task = Task.find(params[:fact][:task_id])
    @fact = task.facts.build(fact_params)

    if @fact.save
      redirect_to daily_report_path(@daily_report), notice: t('controllers.common.created', model: '事実')
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

  def fact_params
    params.require(:fact).permit(%i[task_id title content])
  end

  def set_fact
    @fact = Fact.find(params[:id])
  end

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_daily_report
    @daily_report = DailyReport.find(params[:daily_report_id])
  end
end
