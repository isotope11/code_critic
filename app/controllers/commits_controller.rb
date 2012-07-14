class CommitsController < ApplicationController
  before_filter :load_existing_commit, only: [:show]
  before_filter :load_repo
  before_filter :load_commit, only: [:show]

  def show
  end

  protected
  def load_existing_commit
    @commit = Commit.find_by_sha(params[:id])
  end

  def load_repo
    if @commit
      @repo = @commit.repo
    else
      @repo = Repo.find(params[:repo_id])
    end
    @git_repo = @repo.git_repo
  end

  def load_commit
    @commit ||= Commit.load_from_git_commit(@repo, params[:id])
    if @commit
      @git_commit = @commit.git_commit
    else
      flash[:error] = "No such commit...stop being dumb."
      redirect_to '/' and return
    end
  end
end
