class OrdersController < ApplicationController
  before_action :sanitize_page_params
   responders :flash
   respond_to :json
  def index
    @orders = Order.all      
    # $sum = 0.0
    # item_ids = []
    # @orders.load.each do |order|
    #   # item_ids.push(order.item.id)
    #   # $sum = $sum + order.item.price
    # end
    # array.inject(:+)
    # debugger
    
     @total_price = @orders.joins(:item).pluck(:price).inject(:+)
     @item_ids = @orders.joins(:item).pluck(:id)
   
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
