FactoryBot.define do
  factory :destination_purchase_management do
    user_id                           {1}
    item_id                           {1}
    purchase_management_id            {12}
    post_code                         {'123-4567'}
    prefecture_id                     {7}
    city                              {"前橋市"}
    address                           {"虹7-7-7"}
    building_name                     {"虹ビル305号"}
    phone_number                      {'01207772656'}
  end
end
