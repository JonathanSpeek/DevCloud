# frozen_string_literal: true
# Controller to handle notes
class NotesController < ApplicationController
  before_action :find_note, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @notes = Note.where(user_id: current_user).paginate(page: params[:page], per_page: 4)
    @uploads = Upload.where(user_id: current_user)

    @notes = Note.search(params[:search]).order('created_at DESC').paginate(page: params[:page], per_page: 4) if params[:search]
  end

  def show
  end

  def new
    @folder = Folder.find(params[:folder_id])
    @note = current_user.notes.build
  end

  def create
    @note = current_user.notes.build(note_params)
    @note.folder_id = params[:folder_id]

    if @note.save
      redirect_to controller: 'folders', action: 'show', id: @note.folder_id
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to controller: 'folders', action: 'show', id: @note.folder_id
    else
      render 'edit'
    end
  end

  def destroy
    @note.destroy
    redirect_to folders_path(@note.folder_id)
  end

  private

  def find_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content, :folder_id)
  end
end
