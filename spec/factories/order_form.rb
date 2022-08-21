FactoryBot.define do
  factory :order_form do
    post_code { "111-1111" }
    prefecture_id { "1" }
    municipalities { "1" }
    address { "1" }
    building_name { "1" }
    phone_number { "00000000000"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end