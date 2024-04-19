# Students Courses Management System - CLI App

This CLI application manages courses, students, and course enrollments for an educational institution. It provides functionalities to manage courses, students, and their enrollments, along with saving data to respective CSV files.

## Sections

- [Course Management](#course-management)
- [Student Management](#student-management)
- [Course Enrollment](#course-enrollment)

## Tasks

- Implement the following screens but skip the saving option for now.
- Implement the saving option. It should save data to respective CSV files like courses in `courses.csv`.

---

## Screens/Sections

### Main Screen

**Students Management System**

Course Management
Student Management
Course Enrollment
Exit Program
yaml
Copy code

**Enter your choice:** `<user-choice>`

---

### Courses Management Screen

**Course Management**

1. List Courses
2. Add Course
3. Edit Course
4. Delete Course
5. Save Courses
6. Go back to previous menu


#### Save following data for the course

- **ID**: auto-generation, auto-increment, integer
- **name**: Course Name

---

### Students Management Screen

**Student Management**

1. List Students
2. Add Student
3. Edit Student
4. Delete Student
5. Save Students
6. Go back to previous menu


#### Save following data for the student

- **ID**: auto-generation, auto-increment, integer
- **first_name**: First Name
- **last_name**: Last Name

---

### Course Enrollment Screen

**Course Enrollment**

1. Show courses enrolled by a student
2. Show students enrolled in course
3. Add Course Enrollment
4. Delete Course Enrollment
5. Save Course Enrollments
6. Go back to previous menu

#### Save following data for the course enrollment

- **ID**: auto-generation, auto-increment, integer
- **course_id**: Course ID
- **student_id**: Student ID