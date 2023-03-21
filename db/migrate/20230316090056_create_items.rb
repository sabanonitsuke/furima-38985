class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :shipping_fee_payer_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :processing_time_id, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
