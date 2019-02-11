class OrdersController < ApplicationController
  before_action :sanitize_page_params
   responders :flash
   respond_to :json
  def index
    @orders = Order.all
    $sum = 0.0
    @orders.each do |order|
      $sum = $sum + order.purchase.item.price
    end
    @total_price = $sum
    
    # render json: @orders
  end
  
  def new
  end
  
  def create
   
    purchase = Purchase.create!(user_id: current_user.id , item_id: params[:item_id] )
    @order = Order.new user_id: current_user.id, purchase_id: purchase.id
    
    respond_to do |format|
      if @order.save!
            format.html {redirect_to root_path , notice: "item added to your order list, totalll price so far #{$sum}"}
            format.json 
      end
    end
  end

  def show
  end
  
 
  
  
  private
  
  def purchase_params
    params.require(:order).premit(:user_id, :item_id)
  end
  
   def sanitize_page_params
    params[:user_id] = params[:user_id].to_i
    params[:item_id] = params[:item_id].to_i
  end

end
