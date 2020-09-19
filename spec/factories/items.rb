FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
    name {"ネーム"}
    description {"テキスト"}
    category_id {"2"}
    status_id {"2"}
    cost_id {"2"}
    area_id {"2"}
    days_id {"2"}
    price {"3000"}

    association :user
    
  end
end
