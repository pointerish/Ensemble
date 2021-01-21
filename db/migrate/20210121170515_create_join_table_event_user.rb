class CreateJoinTableEventUser < ActiveRecord::Migration[6.1]
  def change
    create_join_table :events, :users do |t|
      t.index [:event_id, :user_id]
      t.index [:user_id, :event_id]
    end
  end
end
