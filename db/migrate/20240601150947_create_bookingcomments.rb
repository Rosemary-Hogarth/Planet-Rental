class CreateBookingcomments < ActiveRecord::Migration[7.1]
  def change
    create_table :bookingcomments do |t|
      t.string :status
      t.date :date_in
      t.date :date_out
      t.float :total_price
      t.references :user, null: false, foreign_key: true
      t.references :planet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
