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
    @center=Center.find_by :id=>params[:id]
    erb :"/centers/show"
  end



end
