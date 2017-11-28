class Merchant < ApplicationRecord
  has_many :items
  has_many :customers
  has_many :invoices
end
