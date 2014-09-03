class AddManagerIdToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :manager_id, :string
  end
end
