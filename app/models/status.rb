class Status < ActiveHash::Base
  self.data = [
    {id:0, status: 'すべて'},
    {id:1, status: '販売中'},
    {id:2, status: '売却済'}
  ]
end
