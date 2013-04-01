require_relative '../../db/config'
class Teacher < ActiveRecord::Base
	has_many :students, :through => :studentteachers
	has_many :studentteachers,:foreign_key => :teacher_id
	validates :email ,:uniqueness => true
end