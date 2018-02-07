class String
  def titlecase
    "#{self.split.each{ |word| word.capitalize!}.join(' ')}"
  end
end

class Project
  def initialize(name, current=0, target)
    @name = name.titlecase
    @current = current
    @target = target
  end

  def add
    @current += 25
    "Project #{@name} got more funds!"
  end

  def subtract
    @current -= 15
    "Project #{@name} lost some funds!"
  end

  def to_s
    "Project #{@name} has $#{@current} in funding towards a goal of $#{@target}."
  end
end

proj1 = Project.new("cat surgery", 3000)
puts proj1
puts proj1.add
puts proj1
puts proj1.add
puts proj1
puts proj1.subtract
puts proj1
