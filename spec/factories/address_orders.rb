FactoryBot.define do
  factory :address_order do
    postal_code {"123-4567"}
    prefecture_id {"2"}
    municipality {"堺市"}
    address {"原町123-3"}
    building {"マンション"}
    tel {"08012345678"}
    token {"1111"}
  end
end
