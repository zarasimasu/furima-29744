FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    family_name {"原"}
    first_name {"彰宣"}
    family_name_kana {"ヤマダ"}
    first_name_kana {"タカユキ"}
    birthday {"2020-11-11"}
  end
end