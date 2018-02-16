require_relative 'project'
require_relative 'die'

class Category
  attr_reader :title

  def initialize(title)
    @title = title
    @projects = []
  end

  def add_project(a_project)
    @projects << a_project
  end

  def request_funding
    puts "There are #{@projects.size} projects in #{@title}: "
    puts @projects

    @projects.each do |project|
      die = Die.new
      number_rolled = die.roll
      if number_rolled.even?
        project.add
      else
        project.subtract
      end
      puts project
      puts project.status
    end
  end
end
