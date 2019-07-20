# User.create!(
#   [
#     {
#       nickname: "Aくん",
#       email: "akun@test.com",
#       password: "xxxxxxxxxx", 
#       encrypted_password: "xxxxxxxxxx", 
#       last_name: "Tanaka",          
#       first_name: "Taka",         
#       last_name_kana: "タナカ",     
#       first_name_kana: "タカ",    
#       birthday: 19940715,          
#       tel: 0000000000,              
#       avatar: "member_photo_noimage_thumb.png"
#     },
#     {
#       nickname: "Bくん",
#       email: "bkun@test.com",
#       password: "xxxxxxxxxx", 
#       encrypted_password: "xxxxxxxxxx", 
#       last_name: "Takaoka",          
#       first_name: "Taka",         
#       last_name_kana: "タカオカ",     
#       first_name_kana: "タカ",    
#       birthday: 19940715,          
#       tel: 0000000000,              
#       avatar: "member_photo_noimage_thumb.png"
#     },
#   ]
# )

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

# Condition.create!(
#   [
#     {
#       conditions: "新品、未使用"
#     },
#     {
#       conditions: "未使用に近い"
#     },
#     {
#       conditions: "目立った傷や汚れなし"
#     },
#     {
#       conditions: "やや傷や汚れあり"
#     },
#     {
#       conditions: "傷や汚れあり"
#     },
#     {
#       conditions: "全体的に状態が悪い"
#     }
#   ]
# )