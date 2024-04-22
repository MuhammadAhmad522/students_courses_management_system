class Enrollment

    @@id_count

  def initialize(student, course)
    @id = generate_id
    @student_id = student.getID
    @course_id = course.getID
  end

  private
  def generate_id
    return @@id_count += 1
  end
end
