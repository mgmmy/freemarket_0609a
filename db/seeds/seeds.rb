Product.create!(
  [
    {
      name: "A1",                             
      detail: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede",             
      price: 2000,                            
      user_id: 1,                          
      like:2,
      delivery_fee: 300,  
      created_at: 20190708,                       
      updated_at: 20190708,                       
      condition_id: 1, 
      status_id: 1,  
      brand_id: 1, 
      lar_category_id: 1,  
      mid_category_id: 1,  
      sml_category_id: 1,  
      size_id: 2,  
      delivery_method_id: 1 
    },
    {
      name: "A2",                             
      detail: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede",             
      price: 2000,                            
      user_id: 2,                          
      like:2,
      delivery_fee: 300,  
      created_at: 20190708,                       
      updated_at: 20190708,                       
      condition_id: 1, 
      status_id: 1,  
      brand_id: 2, 
      lar_category_id: 1,  
      mid_category_id: 1,  
      sml_category_id: 1,  
      size_id: 2,  
      delivery_method_id: 1 
    },
    {
      name: "A3",                             
      detail: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede",             
      price: 2000,                            
      user_id: 2,                          
      like:2,
      delivery_fee: 300,  
      created_at: 20190708,                       
      updated_at: 20190708,                       
      condition_id: 1, 
      status_id: 1,  
      brand_id: 1, 
      lar_category_id: 1,  
      mid_category_id: 1,  
      sml_category_id: 1,  
      size_id: 2,  
      delivery_method_id: 1 
    },
    {
      name: "A4",                             
      detail: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede",             
      price: 2000,                            
      user_id: 1,                          
      like:2,
      delivery_fee: 300,  
      created_at: 20190708,                       
      updated_at: 20190708,                       
      condition_id: 1, 
      status_id: 1,  
      brand_id: 1, 
      lar_category_id: 1,  
      mid_category_id: 1,  
      sml_category_id: 1,  
      size_id: 2,  
      delivery_method_id: 1 
    },
    {
      name: "A5",                             
      detail: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede",             
      price: 2000,                            
      user_id: 1,                          
      like:2,
      delivery_fee: 300,  
      created_at: 20190708,                       
      updated_at: 20190708,                       
      condition_id: 1, 
      status_id: 1,  
      brand_id: 1, 
      lar_category_id: 1,  
      mid_category_id: 1,  
      sml_category_id: 1,  
      size_id: 2,  
      delivery_method_id: 1 
    }
  ]
)


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
