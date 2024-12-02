require 'rails_helper'

RSpec.describe '振り返り機能', type: :system do
  let(:daily_report) { create(:daily_report) }
  let(:task) { create(:task, name: 'タスクの内容') }

  it '振り返りを作成することができること' do
    visit daily_report_path(daily_report)
    expect(page).to have_content 'タスクの内容'
    click_on '振り返り'
    fill_in '事実',	with: '事実を一言で'
    fill_in '事実の詳細',	with: '事実の詳細を書き出していく'
    fill_in '問題',	with: '問題をここに書く'
    fill_in '次やること',	with: '次やることをここに書く'
    expect do
      click_on '保存'
      expect(page).to have_content '振り返りを保存しました'
    end.to change(task.retrospectives, :count).by(1)
    expect(page).to have_current_path daily_report_path(daily_report)
    click_link '事実を一言で'
    expect(page).to have_content '事実を一言で'
    expect(page).to have_content '事実の詳細を書き出していく'
    expect(page).to have_content '問題をここに書く'
    expect(page).to have_content '次やることをここに書く'
  end
end
