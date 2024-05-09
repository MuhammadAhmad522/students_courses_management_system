# frozen_string_literal: true

require_relative 'student_management'
require_relative 'course_management'
require_relative 'enrollment_management'


course_management = CourseManagement.new
student_management = StudentManagement.new
enrollment_management = EnrollmentManagement.new(student_management, course_management)

loop do
  puts 'Main Menu'
  puts '1. Course Management'
  puts '2. Student Management'
  puts '3. Course Enrollment'
  puts '4. Exit'
  print 'Enter your choice: '

  user_input = gets.chomp.to_i
  puts "\n"

  case user_input
  when 1
    course_management.manage
  when 2
    student_management.manage
  when 3
    enrollment_management.manage
  when 4
    break
  else
    puts 'Invalid option. Please try again.'
  end
end
