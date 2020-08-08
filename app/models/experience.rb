class Experience < ApplicationRecord
  belongs_to :user
  has_many :reviews, through: :bookings
  has_many :bookings, dependent: :destroy
  validates :title, :experience_type, :description, presence: true
  validates :title, length: { minimum: 10 }
  validates :description, length: { in: 15..500 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 5 }
  validates :address, presence: true
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  # has_rich_text :description
end
