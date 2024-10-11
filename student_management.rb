# frozen_string_literal: true

require_relative 'student'

class StudentManagement
  def initialize
    @students = load_students
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
        list_students
      when 2
        add_student
      when 3
        edit_student
      when 4
        delete_student
      when 5
        save_students
      when 6
        break
      else
        puts 'Invalid choice'
      end
    end
  end

  def list_students
    if @students.empty?
      puts 'No students found'
      puts "\n"
    else
      puts "Total Students: #{@students.length}"
      puts "List of students: "
      puts "\n"
      @students.each do |student|
        puts "Name: #{student.name}"
        puts "ID: #{student.id}"
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
    puts "\nStudent Added Successfully"
  end

  def edit_student
    print 'Enter student id to edit: '
    id = gets.chomp.to_i
    student = @students.find { |student| student.id == id }
    if student
      print 'Enter new First name: '
      student.first_name = gets.chomp
      print 'Enter new Last name: '
      student.last_name = gets.chomp
      puts "\nStudents Updated Successfully...!"
    else
      puts 'Student not found'
    end
  end

  def delete_student
    print 'Enter student id to delete: '
    id = gets.chomp.to_i
    student = @students.find { |student| student.id == id }
    if student
      @students.delete(student)
      puts "Student Record deleted: #{student.name}"
    else
      puts 'Student not found'
    end
  end

  def save_students
    CSV.open('students.csv', 'w') do |csv|
      @students.each do |student|
        csv << [ student.id, student.first_name, student.last_name]
      end
    end
  end

  def load_students
    students = []
    if File.exist?('students.csv')
      CSV.foreach('students.csv') do |row|
        id = row[0].to_i
        fname = row[1]
        lname = row[2]
        students << Student.new(fname, lname, id)
      end
    else
      File.open('students.csv', 'w')
    end
    return students
  end

  def all_students
    @students
  end

  def find_student_by_id(id)
    @students.detect { |student| student.id == id }
  end

end
