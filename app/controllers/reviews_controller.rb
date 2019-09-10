class ReviewsController < ApplicationController

  # GET: /reviews
  get "/reviews" do
    @reviews=Review.all
    erb :"/reviews/index"
  end

  # GET: /reviews/new
  get "/reviews/new" do
    if log_in?
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
    if log_in?
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
    else
       flash[:error]="You have to log in first."
       redirect to "/login"
    end
  end

  # GET: /reviews/5
  get "/reviews/:id" do
    set_review
    erb :"/reviews/show"
  end

  # GET: /reviews/5/edit
  get "/reviews/:id/edit" do
    set_review
    if current_user==@review.user
      erb :"/reviews/edit"
    else
      flash[:error]="You have no right to edit this review."
      redirect to "/reviews"
    end
  end

  # PATCH: /reviews/5
  patch "/reviews/:id" do
    if log_in?
      set_review
        if current_user==@review.user
          @review.update(params[:review])
          @rate=@review.rate
          if params[:rate]
            @rate.update(params[:rate])
          end
          redirect "/reviews/#{@review.id}"
        else
          flash[:error]="You have no right to edit this review."
          redirect to "/reviews/#{@review.id}"
        end
      else
        flash[:error]="You have to log in first."
        redirect to '/login'
      end
  end

  # DELETE: /reviews/5/delete
  delete "/reviews/:id/delete" do
    if log_in?
      set_review
      if current_user==@review.user
        @review.delete
        redirect to "/reviews"
      else
        flash[:error]="You have no right to delete this review."
        redirect to "/reviews"
      end
    else
      flash[:error]="You have to log in first."
      redirect to '/login'
    end
  end
end
