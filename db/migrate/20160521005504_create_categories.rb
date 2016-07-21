class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title

      t.timestamps null: false
    end

    # create_table :categories_events do |t|
    #   t.references :category, index: true, foreign_key: true
    #   t.references :event, index: true, foreign_key: true
    # end

    create_join_table :categories, :events do |t|
      t.index [:category_id, :event_id]
      t.index [:event_id, :category_id]
    end

    # add_reference :events, :category, index: true, foreign_key: true
  end
end
