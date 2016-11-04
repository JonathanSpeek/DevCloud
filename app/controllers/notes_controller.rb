# Controller to handle notes AKA wikis
class NotesController < ApplicationController
  before_action :find_note, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  uses_markdown_preview

  def index
    @notes = Note.where(user_id: current_user).paginate(page: params[:page], per_page: 4)
    @uploads = Upload.where(user_id: current_user)

    if params[:search]
      @notes = Note.search(params[:search]).order('created_at DESC').paginate(page: params[:page], per_page: 4)
    else
      @notes = Note.all.order('created_at DESC').paginate(page: params[:page], per_page: 4)
    end
  end

  def show
  end

  def new
    @note = current_user.notes.build
  end

  def create
    @note = current_user.notes.build(note_params)

    if @note.save
      redirect_to @note
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to @note
    else
      render 'edit'
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_path
  end

  private

  def find_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
