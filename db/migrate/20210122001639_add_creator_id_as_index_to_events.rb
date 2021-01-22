class AddCreatorIdAsIndexToEvents < ActiveRecord::Migration[6.1]
  def change
    add_index :events, :creator_id
  end
end
