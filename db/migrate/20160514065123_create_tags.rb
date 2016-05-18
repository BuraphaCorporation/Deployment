class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.index :name, unique: true
      t.timestamps null: false
    end

    create_table :tagging do |t|
      t.references :events, index: true
      t.references :tags, index: true

      t.timestamps null: false
    end
  end
end
