class ChangeColumnInvoiceItemUnitPrice < ActiveRecord::Migration[5.1]
  def change
    change_column :invoice_items, :unit_price, :bigint
  end
end
