class ChangeDataTelToHalls < ActiveRecord::Migration[7.0]
  def change
    change_column :halls, :tel, :string
  end
end
