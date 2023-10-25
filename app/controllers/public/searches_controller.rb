class Public::SearchesController < ApplicationController
  def genre_search
    @genre_id = params[:genre_id]
    @items = Item.where(genre_id: @genre_id)
    @genres = Genre.all
  end

  def genre
    @genres = Genre.all
  end
end
