class Property < ApplicationRecord
  belongs_to :owner
  has_many :visits, dependent: :destroy
  has_many :leads, dependent: :nullify

  enum :status, { available: 0, reserved: 1, sold: 2 }

  validates :title, :city, :state, :price_cents, presence: true
  validates :price_cents, numericality: { greater_than: 0 }

  # case-insensitive city match
  scope :in_city, ->(city) { where("LOWER(city) = ?", city.to_s.downcase) }
  scope :priced_up_to, ->(cents) { where("price_cents <= ?", cents) }
end
