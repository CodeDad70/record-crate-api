class Api::ArtistsController < ApplicationController

  before_action :set_artist, only: [:show, :update, :destroy]

  def index 
    render json: Artist.all
  end

  def show 
    render json: Artist.find_by(id: params[:id])
  end

  def create
    artist = Artist.new(album_params)
    if artist.save
      render json: artist
    else
      render json: {message: artist.errors}, status: 400 
    end
  end  

  def update 
    if @artist.update(artist_params)
      render json: @artist
    else
      render json: {message: @artist.errors}, status: 400
    end
  end

  def destroy
    if @artist.destroy
      render status: 204
    else
      render json: {message: "Unable to delete"}, status: 400
    end
  end
  
  private

    def set_artist
      @artist = Artist.find_by(id: params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name, :album_id, :profile_url)
    end  


end