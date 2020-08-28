class AddSkuToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :sku, :string
  end
end
