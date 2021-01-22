class RemoveCreatedByFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :created_by, :integer
  end
end
