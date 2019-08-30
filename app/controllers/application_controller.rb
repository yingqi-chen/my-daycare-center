require './config/environment'
require 'sinatra/base'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base


  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
    register Sinatra::Flash
  end

  get "/" do
    erb :welcome
  end

  get '/signup' do
    erb :"/users/signup"
  end

  post '/signup' do
    @user=User.create(params[:user])
    if @user.valid?
      redirect to '/users/#{@user.id}'
    else
      flash[:error]="Did you submit a blank username, email or password? Or did you give me a registered email? That's not acceptable, try again please! "
      #binding.pry
      erb :"/users/error"
    end
  end

  get '/login' do
    erb :"/users/login"
  end

  post '/login' do
    binding.pry
    redirect to '/users/show'
  end

  get '/logout' do

    redirect to '/login'
  end

end
