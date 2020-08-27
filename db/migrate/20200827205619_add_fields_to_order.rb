class AddFieldsToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :state, :string
    add_column :orders, :card_sku, :string
    add_monetize :orders, :amount
    add_column :orders, :checkout_session_id, :string
  end
end
