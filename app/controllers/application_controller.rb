require './config/environment'
require 'sinatra/base'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "61b86f939e883bca157a561d"
    register Sinatra::Flash
  end

  get "/" do
    erb :index
  end

  get '/dashboard' do
    erb :dashboard
  end

end
