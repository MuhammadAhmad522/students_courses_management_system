# frozen_string_literal: true

class Student
  @first_name = ''
  @last_name = ''

  @@id_count = 0 # Class variable to store id count

  def initialize(first_name, last_name, id = nil)
    if id.nil?
      @id = generate_id
      @first_name = first_name
      @last_name = last_name
    else
      @id = id
      @first_name = first_name
      @last_name = last_name
      generate_id
    end

  end

  def id
    @id
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end


  def first_name=(first_name)
    @first_name = first_name
  end

  def last_name=(last_name)
    @last_name = last_name
  end

  private

  def generate_id
    @@id_count += 1
  end
end
