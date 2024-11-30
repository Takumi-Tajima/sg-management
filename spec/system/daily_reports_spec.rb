require 'rails_helper'

RSpec.describe '日報機能', type: :system do
  let(:daily_report) { create(:daily_report) }

  before do
    create(:task, name: 'タスクばらしをする')
  end

  it '日報が表示されること' do
    visit daily_report_path(daily_report)
    expect(page).to have_content '日報'
    expect(page).to have_content '今日やったこと'
    expect(page).to have_content 'タスクばらしをする'
  end
end
