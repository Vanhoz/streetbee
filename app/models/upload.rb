class Upload < ApplicationRecord
  mount_uploader :photo, PhotoUploader
end
