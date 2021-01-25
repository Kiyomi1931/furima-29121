class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|
      t.integer :user_id
      t.integer :item_id
    end
  end
end
