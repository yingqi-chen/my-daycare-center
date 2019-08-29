require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    erb :welcome
  end

  get '/signup' do
    erb :"/users/signup"
  end

  post '/signup' do

    redirect to '/users/show'
  end

  get '/login' do
    erb :"/users/login"
  end

  post '/login' do

    redirect to '/users/show'
  end

  get '/logout' do

    redirect to '/login'
  end

end
