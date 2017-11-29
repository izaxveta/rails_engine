class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  def self.find_merchant(params)
    find_by(params)
  end

  def self.find_all_merchants(params)
    where(params)
  end

  def revenue
    Invoice
     .where(merchant_id: self.id)
     .invoice_revenue
  end
end
