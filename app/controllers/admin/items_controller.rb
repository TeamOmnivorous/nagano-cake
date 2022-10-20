class Admin::ItemsController < ApplicationController
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
end