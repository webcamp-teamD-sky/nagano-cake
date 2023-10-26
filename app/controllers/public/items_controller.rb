class Public::ItemsController < ApplicationController

  def index
    @item = Item.page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item =CartItem
  end

end
