class AddUserIdToOperations < ActiveRecord::Migration[7.0]
  def change
    add_column :operations, :user_id, :int
  end
end
