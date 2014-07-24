class Points < ActiveRecord::Base
  belongs_to :employee
  has_one :category
  scope :given_by
end
