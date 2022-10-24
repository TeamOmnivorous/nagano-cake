class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
  end
  
  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    elsif params[:order][:select_address] == "2"
      @delivery = Delivery.find(params[:order][:delivery_id])
      @order.postal_code = @delivery.postal_code
      @order.address = @delivery.address
      @order.name = @delivery.name

    elsif params[:order][:select_address] == "3"
      @new_delivery = Delivery.new(delivery_params)
      @new_delivery.customer_id = current_customer.id
      @order.postal_code = @new_delivery.postal_code
      @order.address = @new_delivery.address
      @order.name = @new_delivery.name

    end

    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }

  end

  def create
    cart_items = current_customer.cart_items
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_items.each do |cart_item|
        order_item = OrderItem.new
        order_item.item_id = cart_item.item_id
        order_item.order_id = @order.id
        order_item.amount = cart_item.amount
        order_item.price = cart_item.item.price
        order_item.save
      end
      redirect_to :complete
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def complete
  end

  def index
  end

  def show
  end


  private

  def order_params
    params.require(:order).permit(:customer_id, :pay_type, :total_payment, :order_status, :name, :postal_code, :address, :postage)
  end

  def delivery_params
    params.require(:order).permit(:postal_code, :address, :name)
  end

end
