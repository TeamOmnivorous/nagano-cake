class CartItemsController < ApplicationController
 def index
 @cart_items = CartItem.all
 @cart_item = CartItem.new
 @total_payment = 0
 # 合計金額を出す際の定義
 end

 def create
  # カートに入れる　同一商品は個数のみ更新する
  @cart_item = CartItem.new(cart_item_params)
  @cart_item.customer_id = current_customer.id
  # ストロングパラメーターで、個数、item_id、customer_idを受け取っています。
  # もし元々カート内に「同じ商品」がある場合、「数量を追加」更新・保存する
 @item = Item.find_by(params[:cart_item][:item_id])
  # フォームで送られた商品があるかの検索
 @cart_items = current_customer.cart_items.all
  @cart_items.each do |cart_item|
   # カートの中身を一個ずつ取り出して、
   if cart_item.item_id==@cart_item.item_id
    # もし、同じ商品が存在していれば、
      new_amount = cart_item.amount + @cart_item.amount
      # 今の個数に足す　それを、amountに代入。
      cart_item.update_attribute(:amount, new_amount)
      # cart_itemモデルのamountをnew_amountに更新する
      @cart_item.delete
      # 同一商品に関しては、個数だけ更新できたらdelete
   end

    end
    @cart_item.save
     redirect_to cart_items_path,notice:"カートに商品が入りました"
 end

  def update
   @cart_item = CartItem.find(params[:id])
   @cart_item.update(cart_item_params)
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
