class FilePlaceholdersController < ApplicationController
  def show
    @file_placeholder = FilePlaceholder.find(params[:id])
    redirect_to commit_path(@file_placeholder.commit)
  end
end
