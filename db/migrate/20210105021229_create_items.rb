class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                     null: false, defalt: ""
      t.text :info,                       null: false, defalt: ""
      t.integer :category_id,             null: false, defalt: ""
      t.integer :sales_status_id,         null: false, defalt: ""
      t.integer :shipping_fee_status_id,  null: false, defalt: ""
      t.integer :prefecture_id,           null: false, defalt: ""
      t.integer :scheduled_delivery_id,   null: false, defalt: ""
      t.integer :price,                   null: false, defalt: ""
      t.integer :user_id
      t.timestamps
    end
  end
end
