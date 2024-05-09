# frozen_string_literal: true

require_relative 'course'
require 'csv'

class CourseManagement
  def initialize
    @courses = load_courses
  end

  def manage
    loop do
      puts "\n"
      puts 'Course Management'
      puts '1. List Courses'
      puts '2. Add Course'
      puts '3. Edit Course'
      puts '4. Delete Course'
      puts '5. Save Courses'
      puts '6. Go back to previous menu'
      print 'Enter choice: '
      choice = gets.chomp.to_i
      puts "\n"
      case choice
      when 1
        list_courses
      when 2
        add_course
      when 3
        edit_course
      when 4
        delete_course
      when 5
        save_courses
      when 6
        break
      else
        puts "\nInvalid choice"
      end
    end
  end

  def list_courses
    if @courses.empty?
      puts 'No courses found...!'
      puts "\n"
    else
      puts "Total courses: #{@courses.length}"
      puts 'List of courses: '
      puts "\n"
      @courses.each do |course|
        puts "Name: #{course.name}"
        puts "ID: #{course.id}"
        puts "\n"
      end
    end
  end


  def add_course
    print 'Enter course name: '
    name = gets.chomp
    if @courses.find { |course| course.name == name }
      puts 'Course already exists...!'
    else
      @courses << Course.new(name)
      puts 'Course added successfully...!'
    end
  end

  def edit_course
    print 'Enter course id to edit: '
    id = gets.chomp.to_i
    course = @courses.find { |course| course.id == id }
    if course
      print 'Enter new Course name: '
      course.name = gets.chomp
      puts 'Course updated successfully...!'
    else
      puts 'Course not found in the list...!'
    end
  end

  def delete_course
    print 'Enter course id to delete: '
    id = gets.chomp.to_i

    course = @courses.find { |course| puts(course.id); course.id == id }
    if course
      @courses.delete(course)
      puts 'Course deleted successfully...!'
    else
      puts 'Course not found in the list...!'  
    end
  end

  def save_courses
    CSV.open('courses.csv', 'w') do |csv|
      @courses.each do |course|
        csv << [ course.id, course.name]
      end
    end
  end

  def load_courses
    courses = []
    if File.exist?('courses.csv')
      CSV.foreach('courses.csv') do |row|
        id = row[0].to_i
        name = row[1]
        courses << Course.new(name, id)
      end
    else
      File.open('courses.csv', 'w')
    end
    return courses
  end

  def all_courses
    @courses
  end
end
