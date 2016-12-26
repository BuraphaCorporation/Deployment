class CreateEventPictures < ActiveRecord::Migration[5.0]
  def change
    create_table :event_pictures do |t|
      t.references  :event, index: true, foreign_key: true
      t.integer     :sort_index, default: 100
      t.attachment  :media

      t.timestamps null: false
    end
  end
end
