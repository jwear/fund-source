require_relative 'project'

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
      puts project.add
      puts project.add
      puts project.subtract
      puts project
    end
  end
end
