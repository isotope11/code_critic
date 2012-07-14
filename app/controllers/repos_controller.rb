class ReposController < ApplicationController
  before_filter :load_new_repo, only: [:new, :create]
  before_filter :load_repo, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
  end

  def create
    if @repo.save
      flash[:notice] = "Repo created successfully."
      redirect_to @repo
    else
      flash[:error] = "Nope..."
      render :new
    end
  end

  def index
    @repos = Repo.all
  end

  private
  def load_new_repo
    @repo = Repo.new(params[:repo])
  end

  def load_repo
    @repo = Repo.find(params[:id])
  end
end
