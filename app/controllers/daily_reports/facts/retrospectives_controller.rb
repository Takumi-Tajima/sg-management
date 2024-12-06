class DailyReports::Facts::RetrospectivesController < ApplicationController
  before_action :set_fact, only: %i[new create]
  before_action :set_daily_report, only: %i[new create]
  before_action :set_retrospective, only: %i[show]
  def show
  end

  def new
    @retrospective = @fact.build_retrospective
  end

  def create
    @retrospective = @fact.build_retrospective(retrospective_params)

    if @retrospective.save
      redirect_to daily_report_fact_path(@daily_report, @fact), notice: t('controllers.common.created', model: '振り返り')
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
    params.require(:retrospective).permit(%i[potential try])
  end

  def set_retrospective
    @retrospective = Retrospective.find(params[:id])
  end

  def set_fact
    @fact = Fact.find(params[:fact_id])
  end

  def set_daily_report
    @daily_report = DailyReport.find(params[:daily_report_id])
  end
end
