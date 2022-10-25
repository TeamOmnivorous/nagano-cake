class Admin::OrdersController < ApplicationController

  def show

    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @total = 0
    @orders = Order.all
    @confirm = @order_items.where(making_status: 3)

  end

  def update
    @order = Order.find(params[:id])
    @order_items = @order.order_items

    if @order.update(order_params)
      @order_items.each do |order_items|
        if @order.order_status == '入金済み'
          order_items.update(making_status: 1)
        end
      end
      redirect_to admin_order_path(@order)
    else
      redirect_to request.referer
    end

  end

  private

  def order_params
    params.require(:order).permit(:customer_id,:pay_type,:total_payment,:order_status,:name, :postal_code, :address, :postage )
  end

end
