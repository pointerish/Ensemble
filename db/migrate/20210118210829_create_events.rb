class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.datetime :date
      t.integer :created_by

      t.timestamps
    end
  end
end
