class Item < ApplicationRecord
  belongs_to :user
  has_one :movement
  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :genre, presence: true, inclusion: { in: %w(men women) }
  validates :size, presence: true, inclusion: { in: %w(s m l xl) }
  validates :color, presence: true
  validates :kind, presence: true, inclusion: { in: %w(top bottom shoes) }
  validates :photo, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_attribute,
  against: [ :kind, :size, :genre],
  using: {
    tsearch: { prefix: true }
  }
end
