class ListUploads < ActiveInteraction::Base
  def execute
    Upload.all
  end
end