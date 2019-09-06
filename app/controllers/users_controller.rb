class UsersController < ApplicationController
  register Sinatra::Flash

  # GET: /users/5
  get "/users/:id" do
    if log_in?
      @user=User.find_by :id=>params[:id]
      #binding.pry
      if @user==current_user
        @reviews=@user.reviews
        erb :"/users/show"
      else
        flash[:error]="You have no right to check this user's file."
        redirect to '/login'
      end
    else
        redirect to '/login'
    end
  end

  get '/signup' do
    erb :"/users/signup"
  end

  post '/signup' do
    if log_in?
      redirect to "/users/#{session[:user_id]}"
    else
      @user=User.create(params[:user])
      if @user.valid?
        session[:user_id]=@user.id
        redirect to "/users/#{@user.id}"
      else
        flash[:error]="Did you submit a blank username, email or password? Or did you give me a registered email? That's not acceptable, try again please! "
        redirect to "/signup"
      end
    end
  end


end
