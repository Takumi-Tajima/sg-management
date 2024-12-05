require 'rails_helper'

RSpec.describe '振り返り機能', type: :system do
  let(:daily_report) { create(:daily_report) }
  let!(:task) { create(:task, name: 'タスクの内容') }

  it '振り返りを作成することができること' do
    visit daily_report_path(daily_report)
    expect(page).to have_content 'タスクの内容'
    click_on '事実の追加'
    fill_in '事実',	with: '事実を一言で'
    fill_in '事実の詳細',	with: '事実を詳細を書きます'
    expect do
      click_on '登録する'
      expect(page).to have_content '事実を登録しました'
    end.to change(task.facts, :count).by(1)
    click_on '事実を一言で'
    expect(page).to have_content '事実を一言で'
    expect(page).to have_content '事実を詳細を書きます'
  end
end
