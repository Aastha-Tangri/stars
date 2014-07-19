class AddCategoryIdToPoints < ActiveRecord::Migration
  def change
    add_column :points, :category_id, :integer
  end
end
