class Order < ApplicationRecord
   
    belongs_to :user
    belongs_to :item 
    
    
    def self.total_price_order
       sum = 0.0
        Order.includes(:item).all.each do |order|
          sum = sum + order.item.price
        end 
       sum
    end
    
    def self.order_item_ids 
      item_ids = []
        Order.joins(:item).all.each do |order|
          item_ids.push(order.item.id)
         end
      item_ids   
    end
    
    
 
    
end
