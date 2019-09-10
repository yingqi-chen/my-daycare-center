require './config/environment'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base


  configure do
    register Sinatra::Flash
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"

  end

  get "/" do
    if log_in?
      @user=User.find(current_user.id)
    end
    erb :welcome
  end


  get '/login' do
    if session[:user_id]
      redirect to "/users/#{session[:user_id]}"
    else
      erb :"/users/login"
    end
  end

  post '/login' do
    @user=User.find_by :email=>params[:email]
    if @user && @user.authenticate(params[:password])
      session[:user_id]=@user.id
      redirect to "/users/#{@user.id}"
    else
      flash[:error]="That combination doesn't exist!"
      redirect to "/login"
    end
  end

  get '/logout' do
    session.clear
    redirect to '/login'
  end

  helpers do
      def current_user
        User.find_by :id=>session[:user_id]
      end

      def log_in?
        !!session[:user_id]
      end

      def set_review
        @review=Review.find_by :id=>params[:id]
        if !@review
          redirect to "/reviews"
        end
      end

      def log_in_first
        if !log_in?
          flash[:error]="You have to log in first to continue your operation"
          redirect to "/login"
        end
      end

      def correct_user?
        if !(current_user==@review.user)
          flash[:error]="You have no right to do this operation."
          redirect to "/reviews"
        end
      end
  end

end