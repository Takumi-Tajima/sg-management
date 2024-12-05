class DailyReports::Facts::MessagesController < ApplicationController
  before_action :set_daily_report, only: %i[new create]
  before_action :set_fact, only: %i[new create]
  def new
    @message = @fact.messages.build
  end

  def create
    @message = @fact.messages.create!(message_params)

    openai_client = OpenaiClient.new
    ai_response = openai_client.chat_with_openai(@message.content)

    @fact.messages.create!(content: ai_response)

    redirect_to daily_report_fact_path(@daily_report, @fact)
  end

  private

  def set_daily_report
    @daily_report = DailyReport.find(params[:daily_report_id])
  end

  def set_fact
    @fact = Fact.find(params[:fact_id])
  end

  def message_params
    params.require(:message).permit(%i[role content])
  end
end
