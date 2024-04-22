require_relative 'course'

class CourseManagement

    def initialize(courses)
        @courses = courses
    end
  
    def manage()
        loop do
            puts "Course Management"
            puts "1. List Courses"
            puts "2. Add Course"
            puts "3. Edit Course"
            puts "4. Delete Course"
            puts "5. Save Courses"
            puts "6. Go back to previous menu"
            print "Enter choice: "
            choice = gets.chomp.to_i
            puts "\n"
            case choice
            when 1
                list_courses(@courses)
            when 2
                add_course()
            when 3
                edit_course(@courses)
            when 4
                delete_course(@courses)
            when 5
                save_courses(@courses)
            when 6
                break
            else
                puts "\nInvalid choice"
            end
        end

      
    end

    def list_courses(courses)
        if courses.empty?
            puts "No courses found...!"
            puts "\n"
    

        else
            puts "Total courses: #{courses.length} \n"
            puts "List of courses: "
            puts "\n"
            courses.each do |course|
                puts "Name: #{course.getName}"
                puts "ID: #{course.getID}"
                puts "\n"

            end
            
        end
        puts "\n"
         
    end

    def add_course()
        print "Enter course name: "
        name = gets.chomp
        @courses << Course.new(name)
    end

    def edit_course(courses)
        print "Enter course name to edit: "
        name = gets.chomp
        course = courses.find { |course| course.getName == name }
        if course
            print "Enter new Course name: "
            course.setName = gets.chomp
            puts "Course updated"
        else
            puts "Course not found"
        end
    end

    def delete_course(courses)
        print "Enter course name to delete: "
        name = gets.chomp
        course = courses.find { |course| course.getName == name }
        if course
            courses.delete(course)
            puts "course deleted"
        else
            puts "course not found"
        end
    end

    def save_courses(courses)
        # to be implemented
    end

end
