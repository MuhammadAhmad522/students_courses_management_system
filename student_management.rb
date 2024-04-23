# frozen_string_literal: true

require_relative 'student'

class StudentManagement
  def initialize(students)
    @students = students
  end

  def manage
    loop do
      puts "\n"
      puts 'Student Management'
      puts '1. List students'
      puts '2. Add student'
      puts '3. Edit student'
      puts '4. Delete student'
      puts '5. Save students'
      puts '6. Go back to previous menu'
      print 'Enter choice: '
      choice = gets.chomp.to_i
      puts "\n"
      case choice
      when 1
        list_students(@students)
      when 2
        add_student
      when 3
        edit_student(@students)
      when 4
        delete_student(@students)
      when 5
        save_students(@students)
      when 6
        break
      else
        puts 'Invalid choice'
      end
    end
  end

  def list_students(students)
    if students.empty?
      puts 'No students found'
      puts "\n"
      nil

    else
      puts "Total Students: #{students.length}"
      puts "List of students: "
      puts "\n"
      students.each do |student|
        puts "Name: #{student.getName}"
        puts "ID: #{student.getID}"
        puts ""

      end
    end
  end

  def add_student
    print 'Enter student First name: '
    fname = gets.chomp
    print 'Enter student Last name: '
    lname = gets.chomp
    @students << Student.new(fname, lname)
  end

  def edit_student(students)
    print 'Enter student id to edit: '
    id = gets.chomp.to_i
    student = students.find { |student| student.getID == id }
    if student
      print 'Enter new First name: '
      student.setFirstName = gets.chomp
      print 'Enter new Last name: '
      student.setLastName = gets.chomp

    else
      puts 'Student not found'
    end
  end

  def delete_student(students)
    print 'Enter student name to delete: '
    name = gets.chomp
    student = students.find { |student| student.getName == name }
    if student
      students.delete(student)
      puts 'Students deleted'
    else
      puts 'Student not found'
    end
  end

  def save_students(students)
    # to be implemented
  end
end
