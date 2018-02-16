class String
  def titlecase
    "#{self.split.each{ |word| word.capitalize!}.join(' ')}"
  end
end

class Project
  attr_reader :name, :current, :target

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
    puts "Project #{@name} got more funds!"
  end

  def subtract
    @current -= 10
    puts "Project #{@name} lost some funds!"
  end

  def need
    @target - @current
  end

  def fully_funded?
    need == 0
  end

  def status
    fully_funded? ? "Fully funded" : "Not fully funded"
  end

  def to_s
    "Project #{@name} has $#{@current} in funding towards a goal of $#{@target}.\nThe project still needs $#{need} to reach the goal."
  end
end

if __FILE__ == $0
  proj1 = Project.new("cat surgery", 500, 3000)
  puts proj1
  puts proj1.add
  puts proj1.subtract
  puts proj1
end
