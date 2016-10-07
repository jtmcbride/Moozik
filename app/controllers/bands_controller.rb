class BandsController < ApplicationController
  before_action :check_login
  def new
    @band = Band.new
  end

  def index
    @bands = Band.all
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      render :new
    end
  end

  def show
    @band = Band.includes(:albums).find(params[:id])
  end

  def edit
    @band = Band.find(params[:id])
  end

  def destroy
    Band.destroy(params[:id])
    redirect_to bands_url
  end

  def update
    band = Band.find(params[:id])
    band.update(band_params)
    redirect_to band_url(band)
  end

  def search_results
    @bands = Band.where("lower(name) LIKE ?", "%#{params[:q].downcase}%")
  end

  def search
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
