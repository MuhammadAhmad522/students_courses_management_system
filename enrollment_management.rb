# frozen_string_literal: true

require_relative 'enrollment'

class EnrollmentManagement
  def initialize(students, courses, enrollments)
    @students = students
    @courses = courses
    @enrollments = enrollments
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
  print 'Enter student ID: '
  student_id = gets.chomp.to_i
  enrollments = @enrollments.select { |enrollment| enrollment.get_student_id == student_id }
  if enrollments.empty?
    puts 'No courses found'
  else
    puts 'Courses enrolled by '
    enrollments.each do |enrollment|
      # show student name
      @students.find do |student|
        print "#{student.getName}: " if student.getID == enrollment.get_student_id
      end

      course = @courses.find { |course| course.getID == enrollment.get_course_id }
      puts course.getName
    end
  end
end

def show_students_enrolled_in_course
  print 'Enter course ID: '
  course_id = gets.chomp.to_i
  enrollments = @enrollments.select { |enrollment| enrollment.get_course_id == course_id }
  if enrollments.empty?
    puts 'No students found'
  else
    print 'Students enrolled in '
    enrollments.each do |enrollment|
      # show course name
      @courses.find do |course|
        print "#{course.getName}: " if course.getID == enrollment.get_course_id
      end
      student = @students.find { |student| student.getID == enrollment.get_student_id }
      puts student.getName
    end
  end
end

def add_course_enrollment
  print 'Enter student ID: '
  student_id = gets.chomp.to_i
  print 'Enter course ID: '
  course_id = gets.chomp.to_i
  @enrollments << Enrollment.new(student_id, course_id)
  puts 'Course enrollment added'
  puts "\n"
end

def delete_course_enrollment
  print 'Enter student ID: '
  student_id = gets.chomp.to_i
  print 'Enter course ID: '
  course_id = gets.chomp.to_i
  enrollment = @enrollments.find do |enrollment|
    enrollment.get_student_id == student_id && enrollment.get_course_id == course_id
  end
  if enrollment
    @enrollments.delete(enrollment)
    puts 'Course enrollment deleted'
  else
    puts 'Course enrollment not found'
  end
  puts "\n"
end

def save_course_enrollments
  puts 'To be implemented'
end
