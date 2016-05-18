class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.references :events, index: true
      t.references :tags, index: true

      t.timestamps null: false
    end
  end
end
