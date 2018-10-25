class UploadsController < ApplicationController
  def index
    paginate ListUploads.run!(user: current_user), per_page: 5
  end

  def upload
    upload = CreateUpload.run!(photo: params[:photo], user: current_user)
    if upload.valid?
      render status: :created
    else
      render status: :unprocessible_entity
    end
  end
end
