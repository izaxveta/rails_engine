class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items
  has_many :transactions

  def invoice_revenue
    joins(:transactions, :invoice_items)
    .where('transaction.result = ?', "success" )
    
  end 
end
