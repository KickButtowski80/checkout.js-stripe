class ChangeDataTypeForPrice < ActiveRecord::Migration[5.2]
  def change
      change_column(:items, :price, :decimal )
  end
  
      def up
        change_column :items, :price, :decimal
    end

    def down
        change_column :items, :price, :integer
    end
end
