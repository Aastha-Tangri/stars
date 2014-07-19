class RenameColumnInCategory < ActiveRecord::Migration
  def change
    rename_column :categories, :points, :stars
  end
end
