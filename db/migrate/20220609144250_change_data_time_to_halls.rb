class ChangeDataTimeToHalls < ActiveRecord::Migration[7.0]
  def change
    change_column :halls, :time, :string
  end
end
