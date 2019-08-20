## usersテーブル

|column|type|option|
|------|----|------|
|nickname|string|null: false|
|mail|string|null: false, unique: true|
|password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: fasle|
|first_name_kana|string|null: false|
|birthday|integer|null: fasle|
|tel|integer|unique: ture|
|avatar|string|

### Association
- has_one :address
- has_many :cards
- has_many :products
- has_many :buyer_purchases, class_name: 'Purchases', :foreign_key => 'buyer_id'
- has_many :seller_purchases, class_name: 'Purchases', :foreign_key => 'seller_id'
- has_many :ratings
- has_one :profile
- has_many :comments
- has_many :purchases


## products(商品テーブル)

|column|type|option|
|------|----|------|
|name|string|null: false|
|detail|text|
|condition_id|integer|
|delivery_method_id|integer|
|shipment_id|integer|
|charge_id|integer|
|price|integer|null: false|
|status_id|string|null: false, foreign_key: true|
|brand_id|reference|foreign_key: true|
|category_id|reference|foreign_key: true|
|size_id|reference|foreign_key: true|
|user_id|reference|null, false, foreign_key: true|
|like|integer|

### Association
- belongs_to :user
- has_one :brand
- has_one :category
- has_one :size
- has_many :images
- has_many :favorites
- has_one :purchase
- has_many :comments


## addresses (住所テーブル)

|column|type|option|
|------|----|------|
|zip_code|integer|null: false|
|prefecture_id|reference|null: false, foreign_key: true|
|city|string|null: false|
|block|string|null: false|
|building|string|
|uer_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :prefecture
- has_many :purchases


## prefectures(地域テーブル)

|column|type|option|
|------|----|------|
|prefectures|integer|null: false|

### Association
- belongs_to :address
- has_many :products


## cards (クレジットカードテーブル)

|column|type|option|
|------|----|------|
|number|integer|null: false|
|effect_m|integer|null: false|
|effect_y|integer|null: false|
|sce_code|integer|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|user_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :uer
- belongs_to :purchase


## profiles(プロフィールテーブル)

|column|type|option|
|------|----|------|
|user_id|reference|foreign_key: true|
|introduce|text|

### Association
- belongs_to :user


## social_medias(SNSテーブル)

|column|type|option|
|------|----|------|
|media|string|foreign_key: true|
|user_id|reference|foreign_key: true|

### Association
- belongs_to :user


## lar_categories(大カテゴリーテーブル)

|column|type|option|
|------|----|------|
|name|string|

###Association
- has_many :products
- has_many :mid_categories


## mid_categories(中カテゴリーテーブル)

|column|type|option|
|------|----|------|
|name|string|

### Association
- has_many :products
- belongs_to :lar_categories
- has_many :sml_categories
- has_many :sizes


## sml_categories(小カテゴリーテーブル)

|column|type|option|
|------|----|------|
|name|string|

### Association
- has_many :products
- has_one :mid_categories


## sizes (サイズテーブル)

|column|type|option|
|------|----|------|
|clothes|string|
|mens_shoes|string|
|ladies_shoes|string|

### Association
- has_many :products
- has_one :mid_categorie

## conditions (商品の状態テーブル)

|column|type|option|
|------|----|------|
|conditions|string|

### Association
- has_many :products


## brands (ブランドテーブル)

|column|type|option|
|------|----|------|
|name|string|

### Association
- has_many :products

## images (画像テーブル)

|column|type|option|
|------|----|------|
|image|string|
|product_id|reference|null: false, foreign_key: true|

### Association
- has_many :products

## purchases (購入テーブル)

|column|type|option|
|------|----|------|
|payment|integer|null: false|
|payment_method|string|
|product_id|reference|null: false, foreign_key: true|
|seller_id|reference|foreign_key: true|
|buyer_id|reference|foreign_key: true|
|address_id|reference|null: false, foreign_key: true|
|card_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :buyer, class_name: 'User', :foreign_key=>'buyer_id'
- belongs_to :seller, class_name: 'User', :foreign_key=>'seller_id'
- belongs_to :product
- has_one :address
- has_one :card
- has_one :rating

## ratings (ユーザー評価テーブル)

|column|type|option|
|------|----|------|
|rating|string|
|review|text|
|seller_id|reference|foreign_key: true|
|buyer_id|reference|foreign_key: true|
|purchase_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :purchase


## comments (製品コメントテーブル)

|column|type|option|
|------|----|------|
|comment|text|
|product_id|reference|null: false, foreign_key: true|
|user_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product


## favarites (お気に入り/いいねテーブル)

|column|type|option|
|------|----|------|
|product_id|reference|null: false, foreign_key: true|
|user_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product
