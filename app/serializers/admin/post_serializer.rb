class Admin::PostSerializer < ActiveModel::Serializer
  has_many :items
  has_many :tags
  attributes :id, :title, :lead_sentence, :topic, :accepted, :published_at, :created_at, :updated_at
end
