class CreateUpload < ActiveInteraction::Base
  file :photo

  def execute
    upload = Upload.new(inputs)

    unless upload.save
      errors.merge!(upload.errors)
    end

    compose(CreateUploadMetadata, upload: upload)

    upload
  end
end