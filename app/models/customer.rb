class Customer < ApplicationRecord
  has_many   :invoices
  has_many   :transactions, through: :invoices

  def self.find_customer(params)
    find_by(params)
  end

  def self.find_all_customers(params)
    where(params)
  end

  def self.favorite_merchant(filter = nil)
    results = Invoice
      .where("invoices.customer_id = #{filter}")
      .group("merchant_id")
      .count
    Merchant.find(results.key(results.values.max))
  end
end