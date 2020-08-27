class AddPriceToCards < ActiveRecord::Migration[6.0]
  def change
    add_monetize :cards, :price, currency: { present: false }
  end
end
