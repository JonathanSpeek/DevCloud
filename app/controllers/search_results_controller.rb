# frozen_string_literal: true
# Controller to search results for notes, uploads, and folders
class SearchResultsController < ApplicationController
  def index
    @folders = Folder.where(user_id: current_user.id)
    @notes = Note.where(user_id: current_user.id)
    @uploads = Upload.where(user_id: current_user.id)
    search = params[:search]
    @results = @folders.where('name LIKE ? ', "%#{search}%") +
      @notes.where('title LIKE ? OR content LIKE ? ', "%#{search}%", "%#{search}%") +
      @uploads.where('name LIKE ? ', "%#{search}%")
  end
end
