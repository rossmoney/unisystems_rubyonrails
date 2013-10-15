class CreateLeases < ActiveRecord::Migration
  def change
    create_table :leases do |t|
      t.string :username
      t.string :registration
      t.date :startdate
      t.date :enddate

      t.timestamps
    end
  end
end
