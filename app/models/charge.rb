class Charge < ActiveHash::Base
  self.data = [
    {id:0, payer: 'すべて'},
    {id:1, payer: '送料込み(出品者負担)'},
    {id:2, payer: '着払い(購入者負担)'}
  ]   
end
