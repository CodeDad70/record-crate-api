class Api::AlbumsController < ApplicationController

  before_action :set_album, only: [:show, :update, :destroy]

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

  def update 
    if @album.update(album_params)
      render json: @album
    else
      render json: {message: @album.errors}, status: 400
    end
  end

  def destroy
    if @album.destroy
      render status: 204
    else
      render json: {message: "Unable to delete"}, status: 400
    end
  end
  
  private

    def set_album
      @album = Album.find_by(id: params[:id])
    end

    def album_params
      params.require(:album).permit(:name, :artist_id, :price, :image_url)
    end  


end

