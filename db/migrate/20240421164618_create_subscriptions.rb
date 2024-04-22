class CreateSubscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :subscriber, null: false, foreign_key: false
      t.boolean :active

      t.timestamps
    end
  end
end
