FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    first_name_kana{"ニホン"}
    last_name_kana{"ヒト"}
    birthday{"2000/01/01"}
  end
end