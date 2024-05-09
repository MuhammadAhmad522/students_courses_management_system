# frozen_string_literal: true

require_relative 'enrollment'
require_relative 'student_management'
require_relative 'course_management'

class EnrollmentManagement
  def initialize (students, courses)
    @students_mgmt = students
    @courses_mgmt = courses
    @enrollments = load_enrollments
    p @students_mgmt
    p @courses_mgmt
    p @enrollments
  end

  def manage
    loop do
      puts "\n"
      puts 'Course Enrollment'
      puts '1. Show courses enrolled by a student'
      puts '2. Show students enrolled in a course'
      puts '3. Add Course Enrollment'
      puts '4. Delete Course Enrollment'
      puts '5. Save Course Enrollments'
      puts '6. Go back to previous menu'
      user_input = gets.chomp.to_i
      puts "\n"
      case user_input
      when 1
        show_courses_enrolled_by_student
      when 2
        show_students_enrolled_in_course
      when 3
        add_course_enrollment
      when 4
        delete_course_enrollment
      when 5
        save_course_enrollments
      when 6
        return
      else
        puts 'Invalid choice'
      end
    end
  end
end

def show_courses_enrolled_by_student
  p @students_mgmt
  p @courses_mgmt
  p @enrollments
  # get student id
  print 'Enter student ID: '
  student_id = gets.chomp.to_i
  # check enrollments against that student id
  enrollments = @enrollments.select { |enrollment| enrollment.student_id == student_id }
  if enrollments.empty?
    puts 'No courses found'
  else
    student = @students_mgmt.find(student_id) # if enrollment found against a student, save that student against the student variable
    puts "Courses enrolled by #{student.name}:" # puts student name
    enrollments.each do |enrollment|
      puts @courses_mgmt.find(enrollment.course_id).name
    end
  end
end


def show_students_enrolled_in_course
  print 'Enter course ID: '
  course_id = gets.chomp.to_i
  enrollments = @enrollments.each { |enrollment| enrollment.course_id == course_id }
  if enrollments.empty?
    puts 'No students found'
  else
    print 'Students enrolled in '
    enrollments.each do |enrollment|
      # show course name
      @courses_mgmt.find do |course|
        print "#{course.name}: " if course.id == enrollment.course_id
      end
      student = @students.find { |student| student.id == enrollment.student_id }
      puts student.name
    end
  end
end

def add_course_enrollment
  print 'Enter student ID: '
  student_id = gets.chomp.to_i
  print 'Enter course ID: '
  course_id = gets.chomp.to_i
  if enrollment_already_exists(student_id, course_id)
    puts "Enrollment already exists"
  else
    @enrollments << Enrollment.new(student_id, course_id)
    puts 'Course enrollment added'
    puts "\n"
  end
end

def delete_course_enrollment
  print 'Enter student ID: '
  student_id = gets.chomp.to_i
  print 'Enter course ID: '
  course_id = gets.chomp.to_i
  enrollment = @enrollments.find { |enrollment| enrollment.student_id == student_id && enrollment.course_id == course_id }
  if enrollment
    @enrollments.delete(enrollment)
    puts 'Course enrollment deleted'
  else
    puts 'Course enrollment not found'
  end
  puts "\n"
end

def save_course_enrollments
  CSV.open('enrollments.csv', 'w') do |csv|
    @enrollments.each do |enrollment|
      csv << [ enrollment.id, enrollment.student_id, enrollment.course_id]
    end
  end
end


def load_enrollments
  enrollments = []
  if File.exist?('enrollments.csv')
    CSV.foreach('enrollments.csv') do |row|
      id = row[0].to_i
      student_id = row[1].to_i
      course_id = row[2].to_i
      enrollments << Enrollment.new(id, student_id, course_id)
    end
  else
    File.open('enrollments.csv', 'w')
  end
  return enrollments
end

def enrollment_already_exists(student_id, course_id)
  @enrollments.find do |enrollment| 
    if (enrollment.student_id == student_id && enrollment.course_id == course_id)
      return true
    else 
      return false
    end
  end
end
