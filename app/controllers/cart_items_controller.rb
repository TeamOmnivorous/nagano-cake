class CartItemsController < ApplicationController
 before_action :authenticate_customer!

 def index
  @cart_items = current_customer.cart_items
 @total_payment = 0
 # 合計金額を出す際の定義
 end

  def create
    # カートに入れる　同一商品は個数のみ更新する
    @cart_item = CartItem.find_by(customer_id: current_customer.id, item_id: params[:cart_item][:item_id])
    if @cart_item.present?
     # 条件分岐
      new_amount = @cart_item.amount + params[:cart_item][:amount].to_i
       # フォームで送られた商品があるかの検索
      @cart_item.update(amount: new_amount)
      # cart_itemモデルのamountをnew_amountに更新する
      redirect_to cart_items_path
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart_item.save
      redirect_to cart_items_path
    end
  end

  def update
   @cart_item = CartItem.find(params[:id])
   @cart_item.update(cart_item_params)
   redirect_to cart_items_path
  end



 def destroy
   cart_item = CartItem.find(params[:id])
   cart_item.destroy
   redirect_to cart_items_path
 end

  def destroy_all  #カート内全て削除
    cart_items = CartItem.all
    cart_items.destroy_all
    redirect_to cart_items_path
  end



 private

 def cart_item_params
    params.require(:cart_item).permit(:item_id,:amount)
 end

end
