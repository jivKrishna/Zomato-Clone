class FoodCategory < ApplicationRecord
  has_many :food_items, dependent: :delete_all
  
  #for implementing elastic serach
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks

  # index_name Rails.application.class.parent_name.underscore
  # document_type self.name.downcase
  #---------------------------------

  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
end
