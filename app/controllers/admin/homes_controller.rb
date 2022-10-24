class Admin::HomesController < ApplicationController


  def top
    @amount_total = 0
    @orders = Order.all
    @order_items = OrderItem.all

  end

end
