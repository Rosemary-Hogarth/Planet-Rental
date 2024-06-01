class AddForeignKeyToPlanets < ActiveRecord::Migration[7.1]
  def change
    add_reference :planets, :user, foreign_key: true
  end
end
