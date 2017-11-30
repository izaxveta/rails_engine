class Customer < ApplicationRecord
  has_many   :invoices

  def self.find_customer(params)
    find_by(params)
  end

  def self.find_all_customers(params)
    where(params)
  end

  def self.favorite_merchant(filter)
    Invoice
      .select("invoices.merchant_id, sum(merchant_id) AS count")
      .where(filter)
      .group(:merchant_id)
      .order("count DESC")
      .limit(1)
  end 
end
