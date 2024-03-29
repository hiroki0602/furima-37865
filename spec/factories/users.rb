FactoryBot.define do
  factory :user do
    nick_name              { Faker::Name.initials(number: 2) }
    family_name            { '山田' }
    first_name             { '太郎' }
    family_name_kana       { 'ヤマダ' }
    first_name_kana        { 'タロウ' }
    birth_date             { '1930-01-01' }
    email                  { Faker::Internet.free_email }
    password               { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation  { password }
  end
end
