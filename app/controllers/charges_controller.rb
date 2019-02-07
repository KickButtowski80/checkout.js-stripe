class ChargesController < ApplicationController
# def new
# end

def create
  # Amount in cents
   debugger
   @amount = params[:amount].to_f
   
  customer = Stripe::Customer.create(
    :email => params[:stripeEmail], 
    :source  => params[:stripeToken]
  )
  

  charge = Stripe::Charge.create(
    :customer    => current_user.id,
    :source  => params[:stripeToken],
    :amount      =>  (@amount * 100).to_i, 
    :description => 'Valued IT customer',
    :currency    => 'usd'
  )
 
 if charge.paid
   
   
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
