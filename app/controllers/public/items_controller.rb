class Public::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per(8)
    p @items
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item =CartItem
    @genres = Genre.all
  end

end
