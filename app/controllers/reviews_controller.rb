class ReviewsController < ApplicationController

  # GET: /reviews
  get "/reviews" do
    @reviews=Review.all
    erb :"/reviews/index"
  end

  # GET: /reviews/new
  get "/reviews/new" do
    @centers=Center.all
    erb :"/reviews/new"
  end

  # POST: /reviews
  post "/reviews" do
    rate=params[:review][:rate].to_i
    center_id=params[:review][:center_id].to_i
    if Helper.log_in?(session)
      if rate>=1 && rate <= 5
        center=Center.find(center_id)
        if Helper.current_user(session).centers.include?(center)
          flash[:error]="You already rated this center before. Here is the review you have."
          review=Review.find_by :center_id=>center_id
          redirect to "/reviews/#{review.id}"
        else
          @review=Review.new(params[:review])
          @review.user=Helper.current_user(session)
          @review.save
          redirect "/reviews"
        end
      else
        flash[:error]="The rate you input is not a valid number. It should be between 1-5."
        redirect to "/reviews/new"
      end
      redirect to "/login"
    end
  end

  # GET: /reviews/5
  get "/reviews/:id" do
    @review=Review.find_by :id=>params[:id]
    #if @review && @review.user==
    erb :"/reviews/show"
  end

  # GET: /reviews/5/edit
  get "/reviews/:id/edit" do
    erb :"/reviews/edit.html"
  end

  # PATCH: /reviews/5
  patch "/reviews/:id" do
    redirect "/reviews/:id"
  end

  # DELETE: /reviews/5/delete
  delete "/reviews/:id/delete" do
    redirect "/reviews"
  end
end
