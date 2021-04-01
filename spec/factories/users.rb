FactoryBot.define do
  factory :user do
    nickname                 {'ak'} 
    email                    {Faker::Internet.free_email}  
    password                 {'000000'}   
    password_confirmation    {password}
    family_name              {"赤松"}
    first_name               {"光太郎"}
    family_name_kana         {"アカマツ"}
    first_name_kana          {"コウタロウ"}
    birth_day                {"2000-6-7"}
  end
end