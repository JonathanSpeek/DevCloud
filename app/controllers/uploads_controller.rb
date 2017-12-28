# frozen_string_literal: true
# Controller to handle the files uploaded by users
class UploadsController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @uploads = Upload.all.where(user_id: current_user)
  end

  def new
    @folder = Folder.find(params[:folder_id])
    @upload = current_user.uploads.new
  end

  def create
    @upload = current_user.uploads.new(upload_params)
    @upload.folder_id = params[:folder_id]

    if @upload.save
      total_data
      flash[:notice] = 'Baller! Your file was uploaded! 🏀'
      redirect_to controller: 'folders', action: 'show', id: @upload.folder_id
    else
      flash[:notice] = 'Well, this is awkward... 😬'
      redirect_to(:back)
    end
  end

  def destroy
    @upload = Upload.find(params[:id])
    if @upload.present?
      @upload.destroy
      total_data
      flash[:notice] = '😎 more room for activities!'
    end
    redirect_to(:back)
  end

  private

  def upload_params
    params.require(:upload).permit(:name, :attachment, :content_type, :size, :folder_id)
  end

  def total_data
    total = 0
    uploads = Upload.all.where(user_id: current_user)
    uploads.each do |upload|
      total += upload.size.to_i if upload.present?
    end
    current_user.total_data = total
    current_user.save
  end
end
