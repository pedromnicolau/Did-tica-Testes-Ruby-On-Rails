class Deal < ApplicationRecord
  belongs_to :property
  belongs_to :lead
  validates :price_cents, numericality: { greater_than: 0 }
end
