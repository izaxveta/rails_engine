class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  def self.find_invoice_item(params)
    find_by(params)
  end

  def self.find_all_invoice_items(params)
    where(params)
  end
end
