FactoryBot.define do
  factory :item do
     name                  {"テスト"}
     price                 {1000}
     explanation           {"テスト"}
     product_status_id     {5}
     shipping_charge_id    {3}       
     prefecture_id         {2} 
     days_to_ship_id       {3}
     category_id           {11}
    
     association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
