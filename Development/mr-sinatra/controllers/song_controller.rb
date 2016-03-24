class SongController < ApplicationController
  helpers SongHelpers

  get '/' do
    find_songs
    slim :songs
  end

  get '/new' do
    protected!
    find_song
    slim :new_song
  end

  get '/:id' do
    find_song
    slim :show_song
  end

  post '/songs' do
    protected!
    create_song
    flash[:notice] = "Song successfully added"
    redirect to("/#{@song.id}")
  end

  get '/:id/edit' do
    protected!
    find_song
    slim :edit_song
  end

  put '/:id' do
    protected!
    update_song
    flash[:notice] = "Song successfully updated"
    redirect to("/#{@song.id}")
  end

  delete '/:id' do
    protected!
    find_song.destroy
    flash[:notice] = "Song deleted"
    redirect to('/')
  end

  post '/:id/like' do
    find_song
    @song.likes = @song.likes.next
    @song.save
    redirect to("/#{@song.id}") unless request.xhr?
    slim :like, :layout => false
  end
end