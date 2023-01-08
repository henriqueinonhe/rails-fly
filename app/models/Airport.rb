class Airport < ApplicationRecord
  validates :code, presence: true, length: { miniumum: 3, maximum: 5 }
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :country_code, presence: true, length: { minimum: 2, maximum: 10 }
  validates :city, presence: true, length: { minimum: 2, maximum: 50 }
  validates :terminal, presence: true, length: { minimum: 2, maximum: 50 }
  validates :region, presence: true, length: { minimum: 2, maximum: 10 }
end
