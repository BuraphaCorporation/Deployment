class CreateGalleries < ActiveRecord::Migration[5.0]
  def change
    create_table :galleries do |t|
      t.references :event, index: true, foreign_key: true
      t.attachment :media

      t.timestamps null: false
    end
  end
end
