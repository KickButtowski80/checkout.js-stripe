class PurchasesController < ApplicationController
  def index
     @purchases = Purchase.all
  end
  
  def new
  end
  
  def create
    @purchase = Purchase.new purchase_params
    @purchase.save!
 
  
  end
  
  private
  
  def purchase_params
    params.require(:purchase).permit(:item_id, :user_id)
  end

end
