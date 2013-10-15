class CreateDayBookings < ActiveRecord::Migration
  def change
    create_table :day_bookings do |t|
      t.string :username
      t.string :registration
      t.date :day

      t.timestamps
    end
  end
end
