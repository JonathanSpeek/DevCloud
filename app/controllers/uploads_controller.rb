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
      current_user.total_data = Upload.all.where(user_id: current_user).sum(:size).to_i
      current_user.save
      redirect_to notes_path, notice: "The file #{@upload.name} has been uploaded."
    else
      render 'new'
    end
  end

  def destroy
    @upload = Upload.find(params[:id])
    if @upload.present?
      @upload.destroy
      current_user.total_data = Upload.all.where(user_id: current_user).sum(:size).to_i
      current_user.save
    end
    redirect_to notes_path
  end

  private

  def upload_params
    params.require(:upload).permit(:name, :attachment, :content_type, :size)
  end
end
