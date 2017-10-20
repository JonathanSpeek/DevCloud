# frozen_string_literal: true
# Controller to search results for notes, uploads, and folders
class SearchResultsController < ApplicationController
  def index
    search = params[:search]
    @results = Folder.where(user_id: current_user, 'name LIKE ? ', "%#{search}%") +
      Note.where(user_id: current_user, 'title LIKE ? OR content LIKE ? ', "%#{search}%", "%#{search}%") +
      Upload.where(user_id: current_user, 'name LIKE ? ', "%#{search}%")
  end
end
