FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {Faker::Internet.free_email}
    password              {"test01"}
    password_confirmation {password}
    last_name             {"田中"}
    first_name            {"太郎"}
    last_name_kana        {"タナカ"}
    first_name_kana       {"タロウ"}
    user_birth_date       {"2000-01-01"}
  end
end
