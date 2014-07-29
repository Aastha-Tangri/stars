class Point < ActiveRecord::Base
  belongs_to :employee
  has_one :category
  validates :given_to, :project, :task, :manager, :category_id,  :presence => true
end
