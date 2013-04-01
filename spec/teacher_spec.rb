require 'rspec'
require 'date'
require_relative '../app/models/teacher'

describe Teacher, "validations" do

  before(:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Base.connection.table_exists?(:teachers).should be_true
    Teacher.delete_all
    puts " deleting all teachers"
  end

  before(:each) do
    
    # @teacher = Teacher.new
    @teacher= Teacher.new
    @teacher.assign_attributes(
      :name => 'Kearny',
      :gender => ['M',"F"].sample,
      :email => 'kreayshawn@oaklandhiphop.net',
      :phone => '(510) 555-1212 x4567'
    )
   
    
  end

  it "should accept valid info" do
    @teacher.should be_valid
  end

  # it "shouldn't accept invalid emails" do
  #   ["XYZ!bitnet", "@.", "a@b.c"].each do |address|
  #     @student.assign_attributes(:email => address)
  #     @student.should_not be_valid
  #   end
  # end

  # it "should accept valid emails" do
  #   ["joe@example.com", "info@bbc.co.uk", "bugs@devbootcamp.com"].each do |address|
  #     @student.assign_attributes(:email => address)
  #     @student.should be_valid
  #   end
  # end

  # it "shouldn't accept toddlers" do
  #   @student.assign_attributes(:birthday => Date.today - 3.years)
  #   @student.should_not be_valid
  # end

  it "shouldn't allow two students with the same email" do
    puts "creating another teacher #{@teacher.email}"
    another_teacher = Teacher.create!(
      :name => @teacher.name,
      :gender => @teacher.gender,
      :email => @teacher.email,
      :phone => @teacher.phone
    )
    @teacher.should_not be_valid
  end

end
