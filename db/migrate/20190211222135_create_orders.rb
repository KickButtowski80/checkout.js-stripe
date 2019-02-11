class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :purchases
      t.references :users
      t.timestamps
    end
  end
end
