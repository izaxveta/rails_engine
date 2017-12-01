class ChangeColumnItemUnitPrice < ActiveRecord::Migration[5.1]
  def change
    change_column :items, :unit_price, :bigint
  end
end
