class OrdersController < ApplicationController
  before_action :sanitize_page_params
  def index
    @orders = Order.all
  end
  
  def new
  end
  
  def create
    purchase = Purchase.create!(user_id: current_user.id , item_id: params[:item_id] )
    @order = Order.new user_id: current_user.id, purchase_id: purchase.id
    @order.save
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
