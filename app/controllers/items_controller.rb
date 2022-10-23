class ItemsController < ApplicationController
  def index
   @items = Item.all
   @genres = Genre.all
   if params[:genre_id].present?
    #presentメソッドでparams[:genre_id]に値が含まれているか確認 => trueの場合下記を実行
    @genre = Genre.find(params[:genre_id])
    @items = @genre.items
   end
  end

  def show
   @item = Item.find(params[:id])
   @genres = Genre.all
   if params[:genre_id].present?
     @genre = Genre.find(params[:genre_id])
   @cart_item =CartItem
   end
  end


 private
 def item_params
  params.require(:item).permit(:genres_id,:name,:explanation,:image,:tax_out_price, :is_saled)
 end




end