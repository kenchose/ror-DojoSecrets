FactoryBot.define do
  factory :user do
    name { "Kenny Pham" }
    email { "kenny@pham.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
