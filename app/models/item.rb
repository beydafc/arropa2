class Item < ApplicationRecord
  belongs_to :user
  has_one :movement
  has_one_attached :photo
end
