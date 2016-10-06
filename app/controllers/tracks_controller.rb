class TracksController < ApplicationController
  before_action :check_login

  def new
    @album = Album.find(params[:album_id])
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      render :new, album_id: params[:album_id]
    end
  end

  def edit
    @track = Track.find(params[:id])
  end

  def update
    track = Track.find(params[:id])
    track.update(track_params)
    redirect_to track_url(track)
  end

  def show
    @track = Track.includes(:album).find(params[:id])
  end

  def destroy
    Track.destroy(params[:id])
    redirect_to root_url
  end

  private

  def track_params
    params.require(:track).permit(:title, :album_id, :lyrics, :bonus_track)
  end
end
