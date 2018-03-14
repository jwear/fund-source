require_relative 'pledges'

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
    @pledge_contributions = Hash.new(0)
  end

  def name=(new_name)
    @name = new_name.titlecase
  end

  def <=>(other)
    other.need <=> need
  end

  def add
    @current += 25
    puts "Project #{@name} got more funds!"
  end

  def subtract
    @current -= 10
    puts "Project #{@name} lost some funds!"
  end

  def pledge_contribution(pledge)
    @pledge_contributions[pledge.name] += pledge.amount
    puts "Project #{@name} received a #{pledge.name} pledge worth $#{pledge.amount}."
    puts "Project #{@name}'s pledges: #{@pledge_contributions}"
  end

  def amounts
    @pledge_contributions.values.reduce(0, :+)
  end

  def need
    @target - total_funds
  end

  def total_funds
    @current + amounts
  end

  def fully_funded?
    need == 0
  end

  def status
    fully_funded? ? "Fully funded" : "Not fully funded"
  end

  def to_s
    "Project #{@name} has $#{@current} in funding towards a goal of $#{@target}."
  end
end

if __FILE__ == $0
  proj1 = Project.new("cat surgery", 500, 3000)
  puts proj1
  puts proj1.add
  puts proj1.subtract
  puts proj1
end
