class OrdersController < ApplicationController
  before_action :sanitize_page_params

  def index
    @orders = Order.all

    @total_price = Order.total_price_and_items_order.sum
    @item_ids =  Order.total_price_and_items_order.item_ids
  end
  
  def new
  end
  
  def create
   
    # purchase = Purchase.create!(user_id: current_user.id , item_id: params[:item_id] )
    @order = Order.new user_id: current_user.id, item_id: params[:item_id] 
    
    respond_to do |format|
      if @order.save!
            format.html {redirect_to root_path , notice: "item added to your order list"}
            format.json 
      end
    end
  end

  def show
  end
  
 
  
  
  private
  
 
  
   def sanitize_page_params
    params[:user_id] = params[:user_id].to_i
    params[:item_id] = params[:item_id].to_i
  end

end
