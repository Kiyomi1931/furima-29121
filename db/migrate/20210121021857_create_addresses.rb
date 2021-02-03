class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code, null: false, defalt: ""
      t.integer :prefecture_id, null: false, defalt: ""
      t.string :city, null: false, defalt: ""
      t.string :addresses, null: false, defalt: ""
      t.string :building
      t.string :phone_number, null: false, defalt: ""
      t.integer :buy_id
    end
  end
end
