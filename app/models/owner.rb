class Owner < ApplicationRecord
  has_many :properties, dependent: :destroy
  validates :name, :email, presence: true
end
