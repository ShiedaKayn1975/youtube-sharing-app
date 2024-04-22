class RemoveSourceIdFromVideoSharings < ActiveRecord::Migration[7.1]
  def change
    remove_column :video_sharings, :source_id
  end
end
