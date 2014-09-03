class Employee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :points_given, class_name: "Point", dependent: :destroy, :foreign_key => 'given_by'
  has_many :points, dependent: :destroy, :foreign_key => 'given_to'
  has_many :subordinates, class_name: "Employee",
                          foreign_key: "manager_id"
  belongs_to :manager, class_name: "Employee"
  validates :ecode,:email, :uniqueness => true, :presence => true
end
