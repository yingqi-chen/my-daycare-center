class CentersController < ApplicationController

  # GET: /centers
  get "/centers" do
    @centers=Center.all
    erb :"/centers/index"
  end

  # GET: /centers/new
  get "/centers/new" do
    log_in_first
    erb :"/centers/new"
  end

  post "/centers" do
    log_in_first
    if !!(Center.find_by :address=>params[:center][:address])
      flash[:error]="A center with same address is already registered. Try to find it!"
      redirect '/centers'
    else
      @center=Center.create(params[:center])
      if @center.valid?
        @center.save
        #binding.pry
        redirect "/centers"
      else
        flash[:error]="Sorry, a center must have a name and an address.If you do input both, check if that  Try again."
        redirect to "/centers/new"
      end
    end
  end

  # GET: /centers/5
  get "/centers/:id" do
    @center=Center.find_by :id=>params[:id]
    @avg= "%.2f" %@center.average
    erb :"/centers/show"
  end
end
