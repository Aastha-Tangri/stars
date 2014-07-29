class Employee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :points, dependent: :destroy, :foreign_key => 'given_to'
  belongs_to :manager, class_name: "Employee"
  validates :ecode,:email, :uniqueness => true
end
