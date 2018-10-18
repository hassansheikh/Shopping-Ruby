class AddDetailsToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :name, :string ,default: ""
    add_column :carts, :number, :string, default: ""
    add_column :carts, :address, :string, default: ""
    add_column :carts, :quantity, :integer, default: 1
  end
end
