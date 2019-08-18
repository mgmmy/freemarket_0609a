load(Rails.root.join('db', 'seeds', "#{Rails.env.downcase}.rb"))



require 'faker/japanese'

50.times do |n|
  gimei = Gimei.new
  User.create(
    nickname: Faker::Japanese::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    first_name: gimei.first.kanji,
    first_name_kana: gimei.first.hiragana,
    last_name: gimei.last.kanji,
    last_name_kana: gimei.last.hiragana,
    birthday: Faker::Time.between(40.years.ago, 18.years.ago, :all).to_s[0, 10],
    tel: Faker::PhoneNumber.phone_number
  )
end
