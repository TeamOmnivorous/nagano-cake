class ItemsController < ApplicationController
  def index
   @genres = Genre.all #@genres = Genre.where(is_active: true)のほうがいいかも？
   if params[:genre_id].present?
     @genre = Genre.find(params[:genre_id])
     @items = @genre.items.page(params[:page]).per(8).reverse_order
   else
     @items = Item.page(params[:page]).reverse_order
    #presentメソッドでparams[:genre_id]に値が含まれているか確認 => trueの場合下記を実行
   end
  end

  def show
   @item = Item.find(params[:id])
   @cart_item = CartItem.new
   @genres = Genre.all
   if params[:genre_id].present?
     @genre = Genre.find(params[:genre_id])
   end
  end


 private
 def item_params
  params.require(:item).permit(:genres_id,:name,:explanation,:image,:tax_out_price, :is_saled)
 end


#@items = Item.page(params[:page]).per(8)

end