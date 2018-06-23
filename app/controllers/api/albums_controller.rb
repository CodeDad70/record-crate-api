class Api::AlbumsController < ApplicationController

  def index 
    render json: Album.all
  end

  def show 
    render json: Album.find_by(id: params[:id])
  end

  def create
    album = Album.new(album_params)
    if album.save
      render json: album
    else
      render json: {message: album.errors}, status: 400 
    end
  end  

    

  private

    def album_params
      params.require(:album).permit(:name, :artist_id, :price, :image_url)
    end  


end

