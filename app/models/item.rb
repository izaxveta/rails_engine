class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items

  def self.find_item(params)
    find_by(params)
  end

  def self.find_all_items(params)
    where(params)
  end
end
