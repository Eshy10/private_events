class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.date :date
      t.integer :creator_id
      t.text :description
      t.string :location
      t.string :title

      t.timestamps
    end
  end
end
