class CreateUpload < ActiveInteraction::Base
  file :photo
  object :user

  validates :photo, presence: true

  def execute
    upload = user.uploads.new(photo: photo)

    unless upload.save
      errors.merge!(upload.errors)
    end

    compose(CreateUploadMetadata, upload: upload)

    upload
  end
end