class Customer < ApplicationRecord
  has_many   :invoices

  def self.find_customer(params)
    find_by(params)
  end

  def self.find_all_customers(params)
    where(params)
  end
end
