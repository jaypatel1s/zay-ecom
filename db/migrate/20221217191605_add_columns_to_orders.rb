class AddColumnsToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :terms_and_conditions, :boolean, default: false
  end
end
