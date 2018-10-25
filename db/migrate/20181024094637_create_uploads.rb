class CreateUploads < ActiveRecord::Migration[5.2]
  def change
    create_table :uploads do |t|
      t.jsonb :metadata
      t.string :photo

      t.timestamps
    end
  end
end
