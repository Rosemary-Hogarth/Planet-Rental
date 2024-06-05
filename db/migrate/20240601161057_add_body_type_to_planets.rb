class AddBodyTypeToPlanets < ActiveRecord::Migration[7.1]
  def change
    add_column :planets, :body_type, :string
  end
end
