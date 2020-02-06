FactoryBot.define do
  factory :authentication do
    auth_token { "MyString" }
    user { nil }
  end
end
