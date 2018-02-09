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
    @current += 50
    "Project #{@name} got more funds!"
  end

  def subtract
    @current -= 10
    "Project #{@name} lost some funds!"
  end

  def need
    @target - @current
  end

  def to_s
    "Project #{@name} has $#{@current} in funding towards a goal of $#{@target}.\nThe project still needs $#{need} to reach the goal."
  end
end

project1 = Project.new("cat surgery", 500, 3000)
project2 = Project.new("vet treatment cost", 150, 2500)
project3 = Project.new("dog surgery", 1000, 5000)

projects = [project1, project2, project3]

projects.each do |project|
  puts project.add
  puts project.add
  puts project.subtract
  puts project.add
  puts project
end
