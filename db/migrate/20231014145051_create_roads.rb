class CreateRoads < ActiveRecord::Migration[6.1]
  def change
    create_table :roads do |t|
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
