class BookmarksController < ApplicationController
  # def new
  #   @list = List.find(params[:list_id])
  #   @bookmark =  Bookmark.new
  # end

  def create
    # params[:bookmark][:movie_id].each do |movie_id|
    # end

    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmarks = @list.bookmarks
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      # render :new, status: :unprocessable_entity
      render "lists/show", status: :unprocessable_entity
    end
  end

  def destroy
    p "=======hello from bookmarks#destroy"
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end

end
