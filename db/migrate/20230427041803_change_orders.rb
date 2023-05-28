class ChangeOrders < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :quantity, :integer, using: 'quantity::integer'
    change_column :orders, :total_price, :integer, using: 'total_price::integer'
  end
end
