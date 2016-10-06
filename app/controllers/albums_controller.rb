class AlbumsController < ApplicationController
  before_action :check_login

  def new
    @band = Band.find(params[:band_id])
    @bands = Band.all
  end

  def create
    album = Album.new(album_params)
    if album.save
      redirect_to root_url
    else
      redirect_to action: 'new', band_id: album_params[:band_id]
    end
  end

  def show
    @album = Album.includes(:tracks, :band).find(params[:id])
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    album = Album.find(params[:id])
    album.update(album_params)
    redirect_to album_url(album)
  end

  private

  def album_params
    params.require(:album).permit(:live_album, :title, :band_id)
  end

end
