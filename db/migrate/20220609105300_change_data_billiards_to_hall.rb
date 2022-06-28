class ChangeDataBilliardsToHall < ActiveRecord::Migration[7.0]
  def change
    change_column :halls, :billiards, :string
  end
end
