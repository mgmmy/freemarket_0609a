FactoryBot.define do

  factory :product do
    image    { File.open("#{Rails.root}/spec/images/289CAEA9-8DA7-45A1-917A-EFFD0FDFF294.jpg")}
  end
end
