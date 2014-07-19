class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.string :given_to
      t.string :given_by
      t.string :project
      t.string :task
      t.text :comment
      t.string :manager

      t.timestamps
    end
  end
end
