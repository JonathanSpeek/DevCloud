class UploadsController < ApplicationController
  before_action :find_upload, only: [:show, :edit, :update, :destroy]
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
      redirect_to notes_path, notice: "The file #{@upload.name} has been uploaded."
    else
      render 'new'
    end
  end

  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy
    redirect_to notes_path, notice:  "The file #{@upload.name} has been deleted."
  end

  private
  def upload_params
    params.require(:upload).permit(:name, :attachment)
  end
end