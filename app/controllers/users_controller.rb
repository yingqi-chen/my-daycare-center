class UsersController < ApplicationController
  register Sinatra::Flash

  # GET: /users/5
  get "/users/:id" do

    if @user=User.find(params[:id])
      binding.pry
      if @user.id==session[:user_id]
        @reviews=@user.reviews
        @centers=@user.centers
       erb :"/users/show"
      else
       flash[:error]="You have no right to check this user's file."
       redirect to '/signup'
      end
    else
      #binding.pry
      flash[:error]="The user doesn't exist."
      redirect to '/signup'
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
