class Topic < ActiveHash::Base
  field :name
  add id: 1, name: 'NEWS'
  add id: 2, name: 'EVENT'
  add id: 3, name: 'COLUMN'
end
