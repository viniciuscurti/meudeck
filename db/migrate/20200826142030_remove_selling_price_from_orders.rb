class RemoveSellingPriceFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :selling_price, :string
  end
end
