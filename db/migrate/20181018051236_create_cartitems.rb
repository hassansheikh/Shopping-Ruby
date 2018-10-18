class CreateCartitems < ActiveRecord::Migration[5.2]
  def change
    create_table :cartitems do |t|
      t.references :Product, foreign_key: true

      t.timestamps
    end
  end
end
