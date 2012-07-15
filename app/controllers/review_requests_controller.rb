class ReviewRequestsController < ApplicationController
  before_filter :load_new_review_request, only: [:new, :create]
  before_filter :load_review_request, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
  end

  def create
    if @review_request.save
      flash[:notice] = "Review Request created successfully."
      redirect_to @review_request
    else
      flash[:error] = "There was a problem creating your review request."
      render :new
    end
  end

  def index
    @review_requests = ReviewRequest.all
  end

  private
  def load_new_review_request
    @review_request = ReviewRequest.new(params[:review_request])
  end

  def load_review_request
    @review_request = ReviewRequest.find(params[:id])
  end
end
