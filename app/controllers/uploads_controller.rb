# frozen_string_literal: true
# Controller to handle the files uploaded by users
class UploadsController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @uploads = Upload.all.where(user_id: current_user)
  end

  def new
    @upload = current_user.uploads.new
  end

  def create
    @upload = current_user.uploads.new(upload_params)

    if @upload.save
      total_data
      redirect_to notes_path

    else
      redirect_to(:back)
    end
  end

  def destroy
    @upload = Upload.find(params[:id])
    if @upload.present?
      @upload.destroy
      total_data
    end
    redirect_to notes_path
  end

  private

  def upload_params
    params.require(:upload).permit(:name, :attachment, :content_type, :size)
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
