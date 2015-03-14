class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.references :user, index: true
      t.string :name
      t.string :video

      t.timestamps null: false
    end
    add_foreign_key :videos, :users
  end
end
