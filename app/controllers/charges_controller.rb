class ChargesController < ApplicationController
# def new
# end

def create
  # Amount in cents
  # debugger
   @amount = params[:amount].to_f
   
  customer = Stripe::Customer.create(
    :email => params[:stripeEmail], 
    :source  => params[:stripeToken]
  )
  

  charge = Stripe::Charge.create(
    :customer => customer.id,
    :amount      =>  (@amount * 100).to_i, 
    :description => 'Valued IT customer',
    :currency    => 'usd'
  )
 
 if charge.paid
  # debugger 
  if params.has_key?(:item_ids)
     params[:item_ids].map(&:to_i).each do |i_id|
      Purchase.create! item_id: i_id, user_id: current_user.id
    end
  else
     Purchase.create item_id: params[:format] , user_id: current_user.id  
  end
  
  Order.all.joins(:user).where(user_id: current_user.id).delete_all  
   
 end

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end
  private
  def charges_params
    params.permit(:stripeEmail, :stripeToken, :order_id)
  end
end
