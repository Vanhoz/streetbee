class UploadsController < ApplicationController
  def index
    paginate ListUploads.run!, per_page: 5
  end

  def upload
    upload = CreateUpload.run(params)
    if upload.valid?
      render status: :created
    else
      render status: :unprocessible_entity
    end
  end
end
