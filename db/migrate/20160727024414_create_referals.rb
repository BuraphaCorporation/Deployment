class CreateReferals < ActiveRecord::Migration[5.0]
  def change
    create_table :referals do |t|

      t.timestamps
    end
  end
end
