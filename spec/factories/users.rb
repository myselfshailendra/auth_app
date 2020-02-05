FactoryBot.define do
  factory :user do
    email { "demo@mailinator.com" }
    password { "Abcd@123" }
    password_confirmation { "Abcd@123" }
    accept_terms { "1" }
  end
end
