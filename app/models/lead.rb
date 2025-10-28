class Lead < ApplicationRecord
  belongs_to :property, optional: true
  validates :name, :email, presence: true
end
