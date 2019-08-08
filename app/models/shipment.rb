class Shipment < ActiveHash::Base
  self.data = [
    {id:1, ship: '1~2日で発送'},
    {id:2, ship: '2~3日で発送'},
    {id:3, ship: '4~7日で発送'}
  ]
end