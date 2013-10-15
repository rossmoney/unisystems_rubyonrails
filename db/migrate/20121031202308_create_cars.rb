class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.string :registration
      t.string :bookingtype
      t.date :servicedue
      t.date :lastservice
      t.boolean :longtermassigned
      t.boolean :forsale
      t.boolean :sold
      t.boolean :outofaction

      t.timestamps
    end
  end
end
