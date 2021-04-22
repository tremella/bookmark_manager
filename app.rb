require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BM < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  # post '/bookmarks' do
  #   new_bookmark = params[:new_bookmark]
  #   connection = PG.connect(dbname: 'bookmark_manager_test')
  #   connection.exec("INSERT INTO bookmarks (url) VALUES('#{new_bookmark}')")
  #   redirect '/bookmarks'
  # end


  get '/add' do
    erb :add
  end

  run! if app_file == $0
end
