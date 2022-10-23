class OrdersController < ApplicationController
  # before_action :permit_params, except: :new

  def new
  end

  def create
    cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    if @order.save
      cart_items.each do |cart_item|
        order_item = OrderItem.new
        order_item.item_id = cart_item.item_id
        order_item.order_id = @order.id
        order_item.amout = cart_item.amout
        order_item.price = cart_item.item.price
        order_item.save
      end
      redirect_to :confirm
      cart_items.destroy_all
    else
      render :new
    end
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:address] == "1"
      @order.name = current_customer.name
      @order.address = current_customer.address
    elsif params[:order][:address] == "2"
      if Delivery.exists?(name: params[:order][:registered])
        @order.name = Delivery.find(params[:order][:registered]).name
        @order.address = Delivery.find(params[:order][:registered]).address
      end
    elsif params[:order][:address] == "3"
      new_delivery = current_customer.delivery.new(delivery_params)
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

end
