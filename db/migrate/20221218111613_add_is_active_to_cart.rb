class AddIsActiveToCart < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :is_active, :boolean, default: :false
  end
end
