class CartItemsController < ApplicationController
 def index
  	@cart_items = CartItem.all
 end

  def create
   @cart_item = CartItem.new(cart_item_params)
    @item = @cart_item.item
    if @cart_item.save
      redirect_to cart_items_path
    else
      redirect_to item_path(@item)
    end
  end

  def update
   @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to request.referer
    end
  end

  def destroy
   @cart_item = CartItem.find(params[:id])
    if cart_items.destroy
      redirect_to request.refere
    end
  end

  def destroy_all
   if CartItem.destroy_all
      redirect_to request.refere
   end
  end




 private

 def cart_item_params
    params.require(:cart_item).permit(:item_id,:amount)
 end

end
