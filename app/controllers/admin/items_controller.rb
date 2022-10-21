class Admin::ItemsController < ApplicationController

 def new
  @item = new
 end
 
 def create
  @item = Item.find(params[:id])
  @item.update(item_params)
 end



  def index
    @items = Item.all
   # @genres = Genres.all
   # if params[:genre_id].present?
    #presentメソッドでparams[:genre_id]に値が含まれているか確認 => trueの場合下記を実行
     # @genre = Genre.find(params[:genre_id])
      #@items = @genre.items
   # end
  end

  def show

  end

 private
 def item_params
  params.require(:item).permit(:genre_id,:name,:explanation,:image,:tax_out_price)
 end



end