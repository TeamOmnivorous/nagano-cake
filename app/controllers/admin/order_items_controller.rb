class Admin::OrderItemsController < ApplicationController

  def update
    @order_items = OrderItem.find(params[:id])
    @order_items.update(order_items_params[:order_id])
    redirect_to admin_order_path(@order_items.id)
  end

  private

  def order_items_params[:order_id]
    params.permit(:making_status )
  end


end
