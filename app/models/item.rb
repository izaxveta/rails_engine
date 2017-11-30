class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.find_item(params)
    find_by(params)
  end

  def self.find_all_items(params)
    where(params)
  end
 
  def self.most_revenue(quantity = 3)
      select("items.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue") 
      .joins(invoice_items: [invoice: [:transactions]])
      .merge(Transaction.unscoped.successful)
      .group(:id)
      .order("revenue DESC")
      .limit(quantity)
  end

  def self.most_items(quantity = 3)
      joins(invoice_items: [invoice: [:transactions]])
      .select("items.* , sum(invoice_items.quantity) AS item_count")
      .where('transactions.result = ?', 'success')
      .order("item_count DESC")
      .group(:id)
      .limit(quantity)
  end 

  def best_day
    invoices
      .select("invoices.created_at, sum(invoice_items.quantity) AS total") 
      .joins(invoice_items: [invoice: [:transactions]])
      .merge(Transaction.unscoped.successful)
      .group(:created_at)
      .order("total DESC")
      .limit(1)
  end 
end
