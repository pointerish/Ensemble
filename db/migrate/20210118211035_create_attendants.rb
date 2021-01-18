class CreateAttendants < ActiveRecord::Migration[6.1]
  def change
    create_table :attendants do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end
end
