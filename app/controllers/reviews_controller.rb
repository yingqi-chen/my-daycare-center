class ReviewsController < ApplicationController

  # GET: /reviews
  get "/reviews" do
    @reviews=Review.all
    erb :"/reviews/index"
  end

  # GET: /reviews/new
  get "/reviews/new" do
    log_in_first
    @centers=Center.all
    erb :"/reviews/new"
  end

  # POST: /reviews
  post "/reviews" do
    center_id=params[:review][:center_id].to_i
    log_in_first
    center=Center.find(center_id)
    if current_user.centers.include?(center)
      flash[:error]="You already rated this center before. Here is the review you have."
      review=Review.find_by :center_id=>center_id, :user_id=>current_user.id
      redirect to "/reviews/#{review.id}"
    else
      @review=Review.new(params[:review])
      @review.user=current_user
      @rate=Rate.create(params[:rate])
      @rate.review=@review
      @rate.center=center
      @rate.save
      #@review.save since the children is saved, when I connect the children with the parent, the parent is saved too
      redirect "/reviews"
    end
  end

  # GET: /reviews/5
  get "/reviews/:id" do
    set_review
    erb :"/reviews/show"
  end

  # GET: /reviews/5/edit
  get "/reviews/:id/edit" do
    log_in_first
    set_review
    correct_user?
    erb :"/reviews/edit"
  end

  # PATCH: /reviews/5
  patch "/reviews/:id" do
    log_in_first
    set_review
    correct_user?
    @review.update(params[:review])
    @rate=@review.rate
    if params[:rate]
      @rate.update(params[:rate])
    end
    redirect "/reviews/#{@review.id}"
  end

  # DELETE: /reviews/5/delete
  delete "/reviews/:id/delete" do
    log_in_first
    set_review
    correct_user?
    @review.delete
    redirect to "/reviews"
  end
end
