class Admin::ItemsController < ApplicationController

 def new
  @item = Item.new
 end

  def create
    @item = Item.new(item_params)

    @item.save
    redirect_to admin_items_path(@item)
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
  params.require(:item).permit(:genre_id,:name,:explanation,:image,:tax_out_price, :is_saled, :price)
 end



end