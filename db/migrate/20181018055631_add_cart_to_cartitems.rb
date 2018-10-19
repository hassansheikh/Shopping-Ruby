class AddCartToCartitems < ActiveRecord::Migration[5.2]
  def change
    add_reference :cartitems, :cart, foreign_key: true
  end
end
