class AddThumbnailToVideoSharings < ActiveRecord::Migration[7.1]
  def change
    add_column :video_sharings, :thumbnail, :text
    add_column :video_sharings, :title, :string
    add_column :video_sharings, :description, :text
    add_column :video_sharings, :video_id, :string
  end
end
