class AddEmployeeIdToPoints < ActiveRecord::Migration
  def change
    add_column :points, :employee_id, :integer
  end
end
