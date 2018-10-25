class AddUploadsToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :uploads, :user
  end
end
