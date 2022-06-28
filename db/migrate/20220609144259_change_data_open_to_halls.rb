class ChangeDataOpenToHalls < ActiveRecord::Migration[7.0]
  def change
    change_column :halls, :open, :string
  end
end
