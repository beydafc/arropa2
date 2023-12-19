class Item < ApplicationRecord
  belongs_to :user
  has_one :movement
  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :genre, presence: true, inclusion: { in: %w(Men Women Non-Binary) }
  validates :size, inclusion: { in: %w(S M L XL) }
  validates :color, presence: true
  validates :type, presence: true, inclusion: { in: %w(Upper Lower Shoes Two-pieces) }
  validates :photo, presence: true
end
