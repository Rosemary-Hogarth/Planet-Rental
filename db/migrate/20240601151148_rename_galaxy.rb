class RenameGalaxy < ActiveRecord::Migration[7.1]
  def change
    rename_column :planets, :glaxy, :galaxy
  end
end
