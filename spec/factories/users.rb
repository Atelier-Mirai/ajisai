FactoryBot.define do
  factory :user do
    name { '太郎' }
    sequence(:email) { |n| "user#{n}@examle.com" } # 連番
    # email { 'test1@example.com' }
    password { 'password' }
  end

  factory :admin_user, class: :user do
    name { 'admin' }
    email { 'admin@example.com' }
    password { 'password' }
    admin { true }
  end
end
