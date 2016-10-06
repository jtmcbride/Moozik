class AlbumsController < ApplicationController
  def new
    @band = Band.find(params[:band_id])
  end

  def create
    album = Album.new(album_params)
    if album.save
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    @album = Album.includes(:tracks).find(params[:id])
  end
  private

  def album_params
    params.require(:album).permit(:live_album, :title, :band_id)
  end
end
