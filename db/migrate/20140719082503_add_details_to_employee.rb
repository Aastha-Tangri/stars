class AddDetailsToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :ecode, :string
    add_column :employees, :date_of_joining, :date
    add_column :employees, :designation, :string
  end
end
