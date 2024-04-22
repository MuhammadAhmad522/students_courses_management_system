class Enrollment

    @@id_count = 0

  def initialize(student_id, course_id)
    @id = generate_id
    @student_id = student_id
    @course_id = course_id
  end

  def getID
    return @id
    
  end

  def get_student_id
    return @student_id
  end

  def get_course_id
    return @course_id
  end

  private
  def generate_id
    return @@id_count += 1
  end
end
