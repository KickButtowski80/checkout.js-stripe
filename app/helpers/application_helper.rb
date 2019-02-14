module ApplicationHelper
    def admin_types
        ['admin user']
    end
    
    def active? path 
        "active" if current_page? path
    end
    
    def admin?
        admin_types.include? current_user.user_type
    end
    
    def user_type_color 
        if admin?
            "btn btn-info"
        else
            "btn btn-secondary"
        end
    end
    
    def listing_orders_times orders
        hash = orders.joins(:item).pluck(:item_id).each_with_object(Hash.new(0)){|key,hash| hash[key] += 1} 
        result = "<ol>"
        hash.each do |order_item, number| 
            item = Item.find order_item
            total_price = item.price * number 
            result +=  "<li style='margin-bottom: 15px'>
                          you have
                          <span class='btn btn-info'>#{item.name}</span>
                           #{number} times so far with price of
                          <span class='btn btn-info'>#{total_price}</span>
                          in total 
                       </li>"                     
        end
        result += "</ol>"
        result.html_safe 
    end
    
    def listing_purchased_times list 
        hash = list.pluck(:item_id).each_with_object(Hash.new(0)){|key,hash| hash[key] += 1} 
        result = " "
        hash.each do |item_id, number| 
            item = Item.find item_id
            total_price = item.price * number 
            result +=                        
            "<div class='card' style='margin-right: 20px;'>       
                  <div class='card-body'>
                    <h5 class='card-title btn btn-info'>#{item.name}</h5>
                    <p class='card-text'>
                         purchased time was <span class=' btn btn-info'>#{number} </span>
                         in total of 
                         <span class=' btn btn-info'>#{total_price}</span>
                    </p>  
                        <a href='items/#{item_id}' class='btn btn-primary'> see Item </a>
                  </div>
                </div> "
        end
        result.html_safe 
    
    
    end
    
    
    
end
