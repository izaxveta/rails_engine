class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices 

  def revenue
    Invoice
     .where(merchant_id: self.id)
     .invoice_revenue
  end 
end
