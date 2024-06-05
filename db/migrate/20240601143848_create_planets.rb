class CreatePlanets < ActiveRecord::Migration[7.1]
  def change
    create_table :planets do |t|
      t.string :name
      t.string :glaxy
      t.string :system
      t.string :description
      t.float :price_per_night

      t.timestamps
    end
  end
end
