class RenameBookingsModelAndAddComment < ActiveRecord::Migration[7.1]
  def change
    rename_table :bookingcomments, :booking
    add_column :booking, :comment, :string
  end
end
