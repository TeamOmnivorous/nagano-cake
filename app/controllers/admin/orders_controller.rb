class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
   
    @orders = Order.all
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_items_path
  end
  
  private
  
  def order_params
    params.require(:order).permit(:customer_id,:pay_type,:total_payment,:order_status,:name, :postal_code, :address, :posta )
  end
  
end
