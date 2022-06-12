class ChangeDataParkingToHalls < ActiveRecord::Migration[7.0]
  def change
  change_column :halls, :parking, :string
  end
end
