class Admin::HomesController < ApplicationController


  def top
    @amount_total = 0
    @orders = Order.order(created_at: :asc).page(params[:page]).per(10).reverse_order
    @order_items = OrderItem.all

  end

end
