class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :city
      t.string :country
      t.integer :mobile

      t.timestamps
    end
  end
end
