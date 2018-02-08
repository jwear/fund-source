class String
  def titlecase
    "#{self.split.each{ |word| word.capitalize!}.join(' ')}"
  end
end

class Project
  attr_accessor :name
  attr_reader :current, :target

  def initialize(name, current=0, target)
    @name = name.titlecase
    @current = current
    @target = target
  end

  def name=(new_name)
    @name = new_name.titlecase
  end

  def add
    @current += 25
    "Project #{@name} got more funds!"
  end

  def subtract
    @current -= 15
    "Project #{@name} lost some funds!"
  end

  def need
    @target - @current
  end

  def to_s
    "Project #{@name} has $#{@current} in funding towards a goal of $#{@target}.\nThe project still needs $#{need} to reach the goal."
  end
end

proj1 = Project.new("cat surgery", 500, 3000)
# puts proj1
# puts proj1.add
# puts proj1
# puts proj1.add
# puts proj1
# puts proj1.subtract
# puts proj1
puts proj1
proj1.name = "dog surgery"
puts proj1.name
puts proj1.current
puts proj1.target
puts proj1.need
puts proj1
