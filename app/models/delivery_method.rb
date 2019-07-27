class DeliveryMethod < ActiveHash::Base
  self.data = [
    {id:1, package: '未定'},
    {id:2, package: 'らくらくメルカリ便'},
    {id:3, package: 'ゆうメール'},
    {id:4, package: 'レターパック'},
    {id:5, package: '普通郵便(定形、定形外'},
    {id:6, package: 'クロネコヤマト'},
    {id:7, package: 'ゆうパック'},
    {id:8, package: 'クリックポスト'},
    {id:9, package: 'ゆうパケット'}
  ]
end
