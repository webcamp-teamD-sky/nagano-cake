class Public::HomesController < ApplicationController

  def top
    # @item = Item.find(params[:item_id])
    @item = Item.order(created_at: :desc).limit(4)
    @genres = Genre.all
  end

  def about
  end

end
