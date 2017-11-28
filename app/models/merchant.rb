class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices 

  def customers_with_pending_invoices
    self.customers.merge(Transaction.success)
  end 
end
