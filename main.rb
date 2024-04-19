loop do
    puts "Students Management System"
    puts "1. Course Management"
    puts "2. Student Management"
    puts "3. Course Enrollment"
    puts "4. Exit Program"
    print "Enter your choice: "
    choice = gets.chomp.to_i

    case choice
    when 1
        course_management
    when 2
        student_management
    when 3
        course_enrollment
    when 4
        exit_program
        break
    else
        puts "Invalid choice. Please try again."
    end
end