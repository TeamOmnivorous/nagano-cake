class Admin::ItemsController < ApplicationController

 def new
  @item = Item.new
 end

  def create
   @item = Item.new(item_params)
   #debugger # @に何が入っているか
   @item.save
   #debugger # @に何が入っているか
   redirect_to admin_items_path
  end


  def index
   @items = Item.all
  end

  def show
   @item = item.find(params[:id])

  end

 private
 def item_params
  params.require(:item).permit(:genre_id,:name,:explanation,:image,:tax_out_price, :is_saled )
 end



end