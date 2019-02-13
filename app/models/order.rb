class Order < ApplicationRecord
    # belongs_to :purchase 
    belongs_to :user
    belongs_to :item
    
    
    def self.total_price_and_items_order
       @@sum = 0.0
       @@item_ids = []
        Order.includes(:item).all.each do |order|
          item_ids.push(order.item.id)
          @@sum = @@sum + order.item.price
        end 
       
    end
    
 
    
    
 
    
end
