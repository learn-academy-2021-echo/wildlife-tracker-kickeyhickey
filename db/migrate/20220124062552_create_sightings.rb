class CreateSightings < ActiveRecord::Migration[6.1]
  def change
    create_table :sightings do |t|
      t.integer :animal_id
      t.datetime :date
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
