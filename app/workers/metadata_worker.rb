class MetadataWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(id, comment, gps_latitude, gps_longitude)
    upload = Upload.find(id)
    comment.each {|key, value| upload.metadata[key] = value}
    upload.metadata['gps_latitude_counted'] = gps_latitude
    upload.metadata['gps_longitude_counted'] = gps_longitude
    upload.save!
  end
end