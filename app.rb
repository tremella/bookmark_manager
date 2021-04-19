require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark_manager'

class BM < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    # @bookmark_manager_list = BookmarkManager.new.list
    @bookmark_manager_list = BookmarkManager.list_all
    erb :bookmarks
  end


  run! if app_file == $0
end
