# frozen_string_literal: true

require_relative 'enrollment'
require_relative 'student_management'
require_relative 'course_management'

class EnrollmentManagement
  def initialize(students, courses)
    @students_mgmt = students
    @courses_mgmt = courses
    @enrollments = load_enrollments
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
      print 'Enter choice: '
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

  def show_courses_enrolled_by_student
    # get student id
    print 'Enter student ID: '
    student_id = gets.chomp.to_i
    # check enrollments against that student id
    enrollments = @enrollments.select { |enrollment| enrollment.student_id == student_id }
    if enrollments.empty?
      puts 'No courses found for the given student id..!'
    else
      student = @students_mgmt.find_student_by_id(student_id) # if enrollment found against a student, save that student against the student variable
      puts "Courses enrolled by #{student.name}:" # puts student name
      enrollments.each do |enrollment| # iterate over enrollments of a single student
        puts @courses_mgmt.find_course_by_id(enrollment.course_id).name # get all the courses
      end
    end
  end

  def show_students_enrolled_in_course
    print 'Enter course ID: '
    course_id = gets.chomp.to_i
    enrollments = @enrollments.select { |enrollment| enrollment.course_id == course_id }
    if enrollments.empty?
      puts 'No students found for the given course id..!'
    else
      course = @courses_mgmt.find_course_by_id(course_id)
      puts "Student enrolled in #{course.name}:"
      enrollments.each do |enrollment|
        puts @students_mgmt.find_student_by_id(enrollment.student_id).name
      end
    end
  end

  def add_course_enrollment
    print 'Enter student ID: '
    student_id = gets.chomp.to_i
    print 'Enter course ID: '
    course_id = gets.chomp.to_i
    if enrollment_already_exists(student_id, course_id)
      puts 'Enrollment already exists'
    else
      @enrollments << Enrollment.new(@students_mgmt.find_student_by_id(student_id).id,
                                     @courses_mgmt.find_course_by_id(course_id).id)
      puts 'Course enrollment added'
      puts "\n"
    end
  end

  def delete_course_enrollment
    print 'Enter student ID: '
    student_id = gets.chomp.to_i
    print 'Enter course ID: '
    course_id = gets.chomp.to_i
    enrollment = @enrollments.find do |enrollment|
      enrollment.student_id == student_id && enrollment.course_id == course_id
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
    CSV.open('enrollments.csv', 'w') do |csv|
      @enrollments.each do |enrollment|
        csv << [enrollment.id, enrollment.student_id, enrollment.course_id]
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
    enrollments
  end

  def enrollment_already_exists(student_id, course_id)
    enrollment_exists = false
    @enrollments.each do |enrollment|
      if enrollment.student_id == student_id && enrollment.course_id == course_id
        enrollment_exists = true
        break
      end
    end
    enrollment_exists
  end
end
