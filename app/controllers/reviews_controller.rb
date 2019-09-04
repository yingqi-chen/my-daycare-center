class ReviewsController < ApplicationController

  # GET: /reviews
  get "/reviews" do
    @reviews=Review.all
    erb :"/reviews/index"
  end

  # GET: /reviews/new
  get "/reviews/new" do
    if Helper.log_in?(session)
      @centers=Center.all
      erb :"/reviews/new"
    else
      flash[:error]="You have to log in first before creating your own review!"
      redirect to "/login"
    end
  end

  # POST: /reviews
  post "/reviews" do
    center_id=params[:review][:center_id].to_i
    if Helper.log_in?(session)
      center=Center.find(center_id)
      if Helper.current_user(session).centers.include?(center)
        flash[:error]="You already rated this center before. Here is the review you have."
        review=Review.find_by :center_id=>center_id
        redirect to "/reviews/#{review.id}"
      else
        @review=Review.new(params[:review])
        @review.user=Helper.current_user(session)
        @rate=Rate.create(params[:rate])
        binding.pry
        @rate.review=@review
        @rate.save
        #@review.save since the children is saved, when I connect the children with the parent, the parent is saved too
        #binding.pry
        #center.rates["#{@review.id}"]=rate
        redirect "/reviews"
      end
    else
       flash[:error]="You have to log in first."
       redirect to "/login"
    end
  end

  # GET: /reviews/5
  get "/reviews/:id" do
    @review=Review.find_by :id=>params[:id]
    erb :"/reviews/show"
  end

  # GET: /reviews/5/edit
  get "/reviews/:id/edit" do
    @review=Review.find_by :id=>params[:id]
    if Helper.current_user(session)==@review.user
      erb :"/reviews/edit"
    else
      flash[:error]="You have no right to edit this review."
      redirect to "/reviews"
    end
  end

  # PATCH: /reviews/5
  patch "/reviews/:id" do
    @review=Review.find_by :id=>params[:id]
    @review.update(params[:review])
    @rate=@review.rate
    @rate.update(params[:rate])
      #binding.pry
#@review.center.rates["#{@review.id}"]=@review.rate
    redirect "/reviews/#{@review.id}"
  end

  # DELETE: /reviews/5/delete
  delete "/reviews/:id/delete" do
    @review=Review.find_by :id=>params[:id]
    if Helper.current_user(session)==@review.user
      @review.delete
      redirect to "/reviews"
    else
      flash[:error]="You have no right to delete this review."
      redirect to "/reviews"
    end
  end
end
