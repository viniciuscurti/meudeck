class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :address, :string
    add_column :users, :address_number, :string
    add_column :users, :address_complement, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :zip_code, :string
    add_column :users, :phone, :string
  end
end
