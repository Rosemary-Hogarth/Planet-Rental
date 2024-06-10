class RemoveBodyTypeFromPlanet < ActiveRecord::Migration[7.1]
  def change
    remove_column :planets, :body_type
  end
end
