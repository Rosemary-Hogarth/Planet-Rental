class RenameBookingToBookings < ActiveRecord::Migration[7.1]
  def change
    rename_table :booking, :bookings
  end
end
