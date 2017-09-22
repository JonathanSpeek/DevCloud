# frozen_string_literal: true
# Controller to handle folders
class FoldersController < ApplicationController
  before_action :find_folder, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @folders = Note.where(user_id: current_user).paginate(page: params[:page], per_page: 4)
    @folders = Folder.search(params[:search]).order('created_at DESC').paginate(page: params[:page], per_page: 4) if params[:search]
  end

  def show
  end

  def new
    @folder = current_user.folders.build
  end

  def create
    @folder = current_user.folders.build(folder_params)

    redirect_to(:back)
  end

  def edit
  end

  def update
    if @folder.update(folder_params)
      redirect_to(:back)
    else
      render 'edit'
    end
  end

  def destroy
    @folder.destroy
    redirect_to(:back)
  end

  private

  def find_folder
    @folder = Folder.find(params[:id])
  end

  def folder_params
    params.require(:folder).permit(:name)
  end
end
