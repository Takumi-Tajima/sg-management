class DailyReports::Facts::MessagesController < ApplicationController
  before_action :set_daily_report, only: %i[new create]
  before_action :set_fact, only: %i[new create]
  def new
    @message = @fact.messages.build
  end

  def create
    @message = @fact.messages.create!(message_params)

    messages = Message.where(fact_id: @fact.id)

    @messages_array = []

    messages.each do |message|
      @messages_array << { role: 'user', content: message.content }
    end

    @messages_array << { role: 'system',
                         content: 'ユーザーが抽象的な質問をした場合は、より具体的な内容を質問するようにしてください。ユーザーが解決したい問題や課題に対しては必ず複数の案を提示してください。あなたはユーザーの内省をサポートする立場で回答をしてください。ユーザーが考えていることをsystemroleとしてもう1つ提示するのでそれを参照して回答すること' }

    @messages_array << { role: 'system', content: @fact.content }

    openai_client = OpenaiClient.new
    ai_response = openai_client.chat_with_openai(@messages_array)

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
