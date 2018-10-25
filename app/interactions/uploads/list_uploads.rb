class ListUploads < ActiveInteraction::Base
  object :user

  def execute
    user.uploads
  end
end