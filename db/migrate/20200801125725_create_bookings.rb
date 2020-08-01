class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :experience, null: false, foreign_key: true
      t.boolean :booked
      t.date :starts_at
      t.date :ends_at

      t.timestamps
    end
  end
end
