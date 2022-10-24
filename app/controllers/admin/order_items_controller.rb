class Admin::OrderItemsController < ApplicationController

  def update
    @order_items = OrderItem.find(params[:id])
    @order_items.update(order_items_params)
    redirect_to admin_orders_path(@order)
  end

  private

  def order_items_params
    params.require(:order_items).permit(:item_id,:order_id,:amount,:price,:making_status )
  end


end
