require_relative 'course'
require_relative 'enrollment'
require_relative 'student_management'
require_relative 'course_management'
require_relative 'enrollment_management'

courses = []
students = []
enrollments = []

loop do
  puts "Main Menu"
  puts "1. Course Management"
  puts "2. Student Management"
  puts "3. Course Enrollment"
  puts "4. Exit"
  print "Enter your choice: "

  user_input = gets.chomp.to_i
  puts "\n"

  case user_input
  when 1
    CourseManagement.new(courses).manage
  when 2
    StudentManagement.new(students).manage
  when 3
    EnrollmentManagement.new(students, courses, enrollments).manage
  when 4
    break
  else
    puts "Invalid option. Please try again."
  end
end