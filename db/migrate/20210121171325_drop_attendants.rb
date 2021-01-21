class DropAttendants < ActiveRecord::Migration[6.1]
  def change
    drop_table :attendants
  end
end
