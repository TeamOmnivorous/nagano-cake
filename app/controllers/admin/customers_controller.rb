class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      render :show
    else
      render :edit
    end
  end

  def orders # 顧客ごとの注文履歴一覧
    @customer = Customer.find(params[:id])
    @orders = @customer.orders.page(params[:page]).order("created_at DESC")
    @amount_total = 0
  end



  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email, :is_deleted)
  end

end
