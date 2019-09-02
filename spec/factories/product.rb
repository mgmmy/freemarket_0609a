FactoryBot.define do

  factory :product do
    name               { Faker::Name.name }
    detail             { Faker::Lorem.sentence }
    user_id            { User.new(id: 1) }
    prefecture_id      { Prefecture.new(id: 3) }
    category_id        { Category.new(id: 79) }
    charge_id          { Charge.new(id: 1) }
    condition_id       { Condition.new(id: 1) }
    delivery_method_id { DeliveryMethod.new(id: 1) }
    shipment_id        { Shipment.new(id: 1) }
    price              { 1000 }
  end
end
