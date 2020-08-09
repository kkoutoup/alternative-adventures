class Experience < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [:title, :description],
    associated_against: {
      user: [:first_name, :last_name]
    },
    using: {
      tsearch: { prefix: true }
    }
  belongs_to :user
  has_many :reviews, through: :bookings
  has_many :bookings, dependent: :destroy
  validates :title, :experience_type, :description, presence: true
  validates :experience_type, inclusion: { in: ["Food/Cooking", "IT", "Drinking", "Sport/Outdoors", "Gardening", "Arts/Design", "Photography", "Music", "Parents&Kids", "Other"] }
  validates :title, length: { minimum: 10 }
  validates :description, length: { in: 15..500 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 5 }
  validates :address, presence: true
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  # has_rich_text :description
end
