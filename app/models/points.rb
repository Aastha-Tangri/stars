class Points < ActiveRecord::Base
  belongs_to :employee#, -> { where given_by: current_employee.ecode }
  has_one :category
end
