class ReviewRequestsController < ApplicationController
  before_filter :load_new_review_request, only: [:new, :create]
  before_filter :load_review_request, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
  end

  def create
    @commit = Commit.find(params[:commit_id])
    @review_user = User.find_by_email(params[:email])
    if @review_user.present?
      @review_request.user_id = @review_user.id
      @review_request.commit_id = @commit.id
      if @review_request.save
        flash[:notice] = "Review Request created successfully."
        redirect_to @commit
      else
        flash[:error] = "There was a problem creating your review request."
        render :new
      end
    else
      flash[:error] = "The user requested was not found."
      redirect_to :back
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
