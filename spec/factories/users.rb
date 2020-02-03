FactoryBot.define do
  factory :user do
    email { "demo@mailinator.com" }
    password { "MyString" }
    password_confirmation { "MyString" }
  end
end
