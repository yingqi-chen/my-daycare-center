class CentersController < ApplicationController

  # GET: /centers
  get "/centers" do
    @centers=Center.all
    erb :"/centers/index"
  end

  # GET: /centers/new
  get "/centers/new" do
    if Helper.log_in?(session)
      erb :"/centers/new"
    else
      flash[:error]="You have to log in first before creating a center!"
      redirect to "/login"
    end
  end

  post "/centers" do
    @center=Center.create(params[:center])
    if @center.valid?
      redirect "/centers"
    else
      flash[:error]="Sorry, a center must have a name and an address. Try again."
      redirect to "/centers/new"
    end
  end

  # GET: /centers/5
  get "/centers/:id" do

    erb :"/centers/show.html"
  end

  # GET: /centers/5/edit
  get "/centers/:id/edit" do
    erb :"/centers/edit.html"
  end

  # PATCH: /centers/5
  patch "/centers/:id" do
    redirect "/centers/:id"
  end



end
