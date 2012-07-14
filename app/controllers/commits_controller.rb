class CommitsController < ApplicationController
  before_filter :load_repo

  def show
    @commit = @git_repo.commit(params[:id])
  end

  protected
  def load_repo
    @repo = Repo.find(params[:repo_id])
    @git_repo = @repo.git_repo
  end
end
