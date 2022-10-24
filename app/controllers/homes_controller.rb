class HomesController < ApplicationController
  def top
    @items = Item.limit(4).order("created_at DESC")
    @genres = Genre.all
  end

  def about
  end
  
 # def unsubscribe
    #@customer = Customer.find_by(email: params[:email])
  #end

  #def withdraw
    #@customer = Customer.find_by(email: params[:email])
   # @customer.update(is_deleted: true)
   # reset_session
    #redirect_to root_path
  #end
end
