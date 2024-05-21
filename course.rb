# frozen_string_literal: true

class Course
  @name = ''

  @@id_count = 0

  def initialize(name, id = nil)
    if id.nil?
      @id = generate_id
      @name = name
    else
      @name = name
      @id = id
      generate_id
    end
  end

  def id
    @id
  end

  def name
    @name
  end

  def name=(name)
    @name = name
  end

  private

  def generate_id
    @@id_count += 1
  end

end
