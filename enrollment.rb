# frozen_string_literal: true

class Enrollment
  @@id_count = 0

  def initialize(id = nil, student_id, course_id)
    if id.nil?
      @id = generate_id
      @student_id = student_id
      @course_id = course_id
    else
      @id = id
      @student_id = student_id
      @course_id = course_id
      generate_id
    end
  end

  def id
    @id
  end

  def student_id
    @student_id
  end

  def course_id
    @course_id
  end

  private

  def generate_id
    @@id_count += 1
  end
end
