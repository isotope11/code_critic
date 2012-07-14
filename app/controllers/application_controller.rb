class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :sessions
  include SessionsHelper
  opinio_identifier do |params|
    next Repo.find(params[:repo_id]) if params[:repo_id]
    next Commit.find(params[:commit_id]) if params[:id]
  end
end
