class CreateOrderShoes < ActiveRecord::Migration[7.0]
  def change
    create_table :order_shoes do |t|
      t.references :order, null: false, foreign_key: true
      t.references :shoe, null: false, foreign_key: true
      t.decimal :price
      t.decimal :discount
      t.boolean :active

      t.timestamps
    end
  end
end
