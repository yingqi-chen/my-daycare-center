class CentersController < ApplicationController

  # GET: /centers
  get "/centers" do
    erb :"/centers/index.html"
  end

  # GET: /centers/new
  get "/centers/new" do
    erb :"/centers/new.html"
  end

  # POST: /centers
  post "/centers" do
    redirect "/centers"
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

  # DELETE: /centers/5/delete
  delete "/centers/:id/delete" do
    redirect "/centers"
  end
end
