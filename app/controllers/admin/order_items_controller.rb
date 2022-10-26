class Admin::OrderItemsController < ApplicationController

  def update
    @order_items = OrderItem.find(params[:id])
    @order =Order.find(@order_items.order_id)




    if @order_items.update(order_items_params)
      if @order.order_items.count == @order.order_items.where(making_status: "製作完了").count
        @order.update(order_status: "発送準備中")
      end
      if @order_items.making_status == '製作中'
        @order.update(order_status: 2)
      end

    else
      redirect_to admin_order_path(@order_items.order_id)
    end
    redirect_to admin_order_path(@order_items.order_id)

  end

  private

  def order_items_params
    params.require(:order_item).permit(:making_status )
  end

  def order_params
    params.permit(:order_status)
  end

end
