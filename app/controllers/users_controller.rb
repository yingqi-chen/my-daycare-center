class UsersController < ApplicationController
  register Sinatra::Flash

  # GET: /users/5
  get "/users/:id" do
    if (@user=User.find_by :id=>(params[:id]))
      if @user.id==session[:user_id]
       erb :"/users/show"
      else
       flash[:error]="You have no right to check this user's file."
       erb :"users/error"
      end
    else
      flash[:error]="The user doesn't exist."
      erb :"users/error"
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
