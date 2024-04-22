class Course
  
    @name = ""
  
    @@id_count = 0

  def initialize(name)
    @id = generate_id
    @name = name
  end

  def getID
    return @id
  end

  def getName
    return @name
  end

  def setName=(name)
    return @name = name    
  end

  private
    def generate_id
      @@id_count += 1
    end  
end
