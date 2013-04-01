require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateStudentteacher < ActiveRecord::Migration
	def change
		create_table :studentteachers do |student_teacher|
			student_teacher.integer :student_id
			student_teacher.integer :teacher_id			
		end
	end
end
