class CreateUploadMetadata < ActiveInteraction::Base
  object :upload

  def execute
    data = Exif::Data.new(File.open('public/' + upload.photo.url))
    user_comment = data.user_comment.encode('ASCII-8BIT').force_encoding('UTF-8')
    comment_json = JSON.parse(user_comment.slice(user_comment.index("{")..-1))
    gps_latitude = data.gps_latitude[0].to_f + data.gps_latitude[1].to_f/60 + data.gps_latitude[2].to_f/3600
    gps_latitude *= -1 unless data.gps_latitude_ref == 'N'
    gps_longitude = data.gps_longitude[0].to_f + data.gps_longitude[1].to_f/60 + data.gps_longitude[2].to_f/3600
    gps_longitude *= -1 unless data.gps_longitude_ref == 'E'
    MetadataWorker.perform_async(upload.id, comment_json, gps_latitude, gps_longitude)
  end
end