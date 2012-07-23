class FileLinePlaceholdersController < ApplicationController
  def show
    @file_line_placeholder = FileLinePlaceholder.find(params[:id])
    redirect_to commit_path(@file_line_placeholder.commit)
  end
end
