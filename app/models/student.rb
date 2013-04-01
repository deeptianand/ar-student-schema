require_relative '../../db/config'

class Student < ActiveRecord::Base
 has_many :studentteachers, :foreign_key => :student_id
 has_many :teachers, :through => :studentteachers
end
