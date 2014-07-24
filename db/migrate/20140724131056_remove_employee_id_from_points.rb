class RemoveEmployeeIdFromPoints < ActiveRecord::Migration
  def change
    remove_column :points, :employee_id
  end
end
