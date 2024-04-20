class CreateVideoSharings < ActiveRecord::Migration[7.1]
  def change
    create_table :video_sharings do |t|
      t.string :video_url
      t.references :user, null: false, foreign_key: true
      t.references :source, null: false, foreign_key: true

      t.timestamps
    end
  end
end
