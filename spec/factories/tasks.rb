FactoryBot.define do
  factory :task do
    name { 'テストを書く' }
    description { 'Rspec & Capybara & FactoryBot を準備する' }
    user
  end

  factory :admin_task do
    name { 'adminテストを書く' }
    description { 'Rspec & Capybara & FactoryBot を準備する' }
    association :user, factory: :admin_user
  end
end
