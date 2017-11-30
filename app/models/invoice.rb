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

  def self.most_expensive(limit = 5)
    select("invoices.id, sum(invoice_items.unit_price * invoice_items.quantity) as revenue")
      .joins(:transactions, :invoice_items)
      .merge(Transaction.unscoped.successful)
      .group(:id)
      .order("revenue DESC")
      .limit(limit)
  end
end
