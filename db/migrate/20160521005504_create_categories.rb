class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title

      t.timestamps null: false
    end

    add_reference :events, :category, index: true, foreign_key: true
  end
end
