class UsersController < ApplicationController
  register Sinatra::Flash

  # GET: /users/5
  get "/users/:id" do
    if Helper.log_in?(session)
      @user=User.find_by :id=>params[:id]
      #binding.pry
      if @user==Helper.current_user(session)
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

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end


end
