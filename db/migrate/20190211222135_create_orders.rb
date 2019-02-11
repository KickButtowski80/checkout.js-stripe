class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :purchase ,   index: true,    foreign_key: true
      t.references :user ,   index: true,    foreign_key: true
    end
  end
end
