class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions

  def self.find_all_invoices(params)
    where(params)
  end

  def self.find_invoice(params)
    find_by(params)
  end

  # def invoice_revenue
  #   joins(:transactions, :invoice_items)
  #   .where('transaction.result = ?', "success" )
  # end
end
