class AddUserIdToHalls < ActiveRecord::Migration[7.0]
  def change
    add_column :halls, :user_id, :integer
  end
end
