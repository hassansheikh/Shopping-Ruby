class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :title
      t.string :delete_status, default: 'not deleted'
      t.string :status, default: 'active'

      t.timestamps
    end
  end
end
