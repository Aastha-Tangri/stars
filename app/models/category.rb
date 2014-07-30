class Category < ActiveRecord::Base
  has_many :points
  has_many :employees, through: :points
end
