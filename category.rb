require_relative 'project'
require_relative 'die'
require_relative 'funding_round'

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
      FundingRound.funding_turns(project)
      puts project
      puts project.status
    end
  end
end
