# frozen_string_literal: true

class Enrollment
  @@id_count = 0

  def initialize(student_id, course_id)
    @id = generate_id
    @student_id = student_id
    @course_id = course_id
  end

  def getID
    @id
  end

  def get_student_id
    @student_id
  end

  def get_course_id
    @course_id
  end

  def to_a
    [@id, @student_id, @course_id]
  end

  private

  def generate_id
    @@id_count += 1
  end
end
