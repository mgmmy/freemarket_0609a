FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    encrypted_password    {"00000000"}
    last_name             {"山田"}
    first_name            {"太朗"}
    last_name_kana        {"やまだ"}
    first_name_kana       {"たろう"}
    birthday              {"19900101"}
    tel                   {"08012345678"}
  end

end