# frozen_string_literal: true

class Course
  @name = ''

  @@id_count = 0

  def initialize(name)
    @id = generate_id
    @name = name
  end

  def getID
    @id
  end

  def getName
    @name
  end

  def setName=(name)
    @name = name
  end

  private

  def generate_id
    @@id_count += 1
  end
end
