FactoryBot.define do
  factory :task do
    daily_report { nil }
    name { "MyString" }
    actual_time { 1 }
  end
end
