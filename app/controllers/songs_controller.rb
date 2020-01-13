class SongsController < ApplicationController
  def new
    @album = Album.find(params[:album_id])
    @song = @album.songs.new
    render :new
  end

  def create
    @album = Album.find(params[:album_id])
    @song = @album.songs.new(song_params)
    if @song.save
      redirect_to album_path(@album)
    else
      render :new
    end
  end

  # Other controller actions go here.

  def show
    @album = Album.find(params[:album_id])
    @song = Song.find(params[:id])
    render :show
  end

  def edit
    @album = Album.find(params[:album_id])
    @song = Song.find(params[:id])
    render :edit
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to album_path(@song.album)
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to album_path(@song.album)
  end

  private
  def song_params
    params.require(:song).permit(:name, :lyrics)
  end
end
