FactoryBot.define do
  factory :order_form do
    postal_code{"222-2222"}
    prefecture_id{2}
    city{"札幌市"}
    addresses{"小樽1-1-1"}
    building{"レオパレス５０５号"}
    phone_number{"01234567890"}

    token{"tok_abcdefghijk00000000000000000"}
  end
end
