class CommitsController < ApplicationController
  before_filter :load_repo
  before_filter :load_commit, only: [:show]

  def show
  end

  protected
  def load_repo
    @repo = Repo.find(params[:repo_id])
    @git_repo = @repo.git_repo
  end

  def load_commit
    @commit = Commit.load_from_git_commit(@repo, params[:id])
    if @commit
      @git_commit = @commit.git_commit
    else
      flash[:error] = "No such commit...stop being dumb."
      redirect_to '/' and return
    end
  end
end
