class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices 

  def revenue
    Invoice
      #narrow to merchant invoices
     .where(merchant_id: self.id)
     #combine with successful transactions
     .invoice_revenue
  end 
end
