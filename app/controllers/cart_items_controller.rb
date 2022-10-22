class CartItemsController < ApplicationController
 def index
  	@cart_items = CartItem.all
 end







 private

 def cart_item_params
    params.require(:cart_item).permit(:item_id)
 end

end
