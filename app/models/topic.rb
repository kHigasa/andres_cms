class Topic < ActiveHash::Base
  fields :name, :code
  add id: 1, code: :news, name: 'NEWS'
  add id: 2, code: :event, name: 'EVENT'
  add id: 3, code: :column, name: 'COLUMN'
end
