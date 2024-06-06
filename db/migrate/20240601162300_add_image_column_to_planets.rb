class AddImageColumnToPlanets < ActiveRecord::Migration[7.1]
  def change
    add_column :planets, :image, :string
  end
end
