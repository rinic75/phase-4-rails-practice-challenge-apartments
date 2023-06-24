class Apartment < ApplicationRecord
  validates :number, presence: true, uniqueness: true
  has_many :tenants, through: :leases
  has_many :leases, dependent: :destroy
end
