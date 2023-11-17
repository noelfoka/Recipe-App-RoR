FactoryBot.define do
  factory :recipe do
    name { 'Test Recipe' }
    description { 'Test Description' }
    preparation_time { 10 }
    cooking_time { 20 }
    user { association(:user) } # Assuming you have a :user factory
  end
end
