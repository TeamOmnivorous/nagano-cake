class DeliveriesController < ApplicationController
 before_action :correct_customer, only: [:edit, :update]

  def index

    @deli = Delivery.new
    @customer=current_customer
    @delis=@customer.deliveries
  end

  def create
    @deli = Delivery.new(delivery_params)
    @deli.customer_id = current_customer.id
    if @deli.save
      redirect_to deliveries_path, notice: "You have created book successfully."
    else
      @customer=current_customer
      @delis = @customer.deliveries
      render :index

    end
  end

  def edit
    @deli = Delivery.find(params[:id])
  end

  def update
    @deli = Delivery.find(params[:id])
    if @deli.update(delivery_params)
      redirect_to deliveries_path, notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    delivery = Delivery.find(params[:id])
    delivery.destroy
    redirect_to deliveries_path
  end

  private



  def delivery_params
    params.require(:delivery).permit(:postal_code, :address, :name)
  end

  def correct_customer
    @deli = Delivery.find(params[:id])
    @customer = @deli.customer_id
    redirect_to(deliveries_path) unless @customer == current_customer.id
  end

end
