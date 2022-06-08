class CreateHalls < ActiveRecord::Migration[7.0]
  def change
    create_table :halls do |t|
      t.string :name
      t.string :url
      t.string :address
      t.integer :tel
      t.integer :time
      t.string :email
      t.string :price
      t.integer :parking
      t.integer :billiards
      t.boolean :open
      t.string :pr
      t.string :lead

      t.timestamps
    end
  end
end
