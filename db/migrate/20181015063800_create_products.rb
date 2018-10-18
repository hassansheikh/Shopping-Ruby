class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :category, foreign_key: true
      t.string :product_code
      t.string :name
      t.float :price
      t.string :description
      t.string :status, default: 'active'
      t.string :delete_status,default: 'not deleted'

      t.timestamps
    end
  end
end
