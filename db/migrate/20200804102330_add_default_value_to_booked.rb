class AddDefaultValueToBooked < ActiveRecord::Migration[6.0]
  def change
    change_column :bookings, :booked, :boolean, default: false
  end
end
