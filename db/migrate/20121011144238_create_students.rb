require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateStudents < ActiveRecord::Migration
	def change
		create_table :students do |student|
			student.string :first_name
			student.string :last_name
			student.string :gender
			student.date :birthday
			student.string :email
			student.string :phone	
		end
	end
end
