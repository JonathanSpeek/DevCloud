# frozen_string_literal: true
# Controller to search results for notes, uploads, and folders
class SearchResultsController < ApplicationController
  def index
    search = params[:search]
    @results = Folder.where('name LIKE ? ', "%#{search}%") +
      Note.where('title LIKE ? OR content LIKE ? ', "%#{search}%", "%#{search}%") +
      Upload.where('name LIKE ? ', "%#{search}%")
  end
end
