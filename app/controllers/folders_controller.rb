# frozen_string_literal: true
# Controller to handle folders
class FoldersController < ApplicationController
  before_action :find_folder, only: [:show, :edit, :update, :destroy]
  before_action :find_parent, only: [:show]
  load_and_authorize_resource

  def index
    @folders = Folder.where(user_id: current_user, parent_folder_id: nil).paginate(page: params[:page], per_page: 4)
    @folders = Folder.search(params[:search]).order('created_at DESC').paginate(page: params[:page], per_page: 4) if params[:search]
  end

  def show
    @folders = Folder.where(user_id: current_user, parent_folder_id: @folder.id)
    @notes = Note.where(user_id: current_user, folder_id: @folder).paginate(page: params[:page], per_page: 4)
    @uploads = Upload.where(user_id: current_user, folder_id: @folder)
  end

  def new
    @folder = current_user.folders.build
  end

  def create
    @folder = current_user.folders.build(folder_params)
    @folder.parent_folder_id = params[:folder][:parent_folder_id]
    if @folder.save
      flash[:notice] = 'Boom! Your Folder successfully saved! 💣'
      redirect_to @folder
    else
      flash[:notice] = 'Hmm... Something went wrong. 🤔'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @folder.update(folder_params)
      flash[:notice] = 'Hot Dog! Your Folder had been updated! 🌭'
      redirect_to root_path
    else
      flash[:notice] = 'Hmm... Something went wrong. 🤔'
      render 'edit'
    end
  end

  def destroy
    @folder.destroy
    flash[:notice] = "✌️ out, #{@folder.name}. No one liked that folder anyway..."
    redirect_to(:back)
  end

  private

  def find_folder
    @folder = Folder.find(params[:id])
  end

  def find_parent
    @parent_folder = Folder.where(user_id: current_user, id: @folder.parent_folder_id)
  end

  def folder_params
    params.require(:folder).permit(:name)
  end
end
