class AddTotalToCart < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :total, :decimal
    add_column :carts, :discount, :decimal
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
