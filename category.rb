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

  def print_name_and_current(project)
    puts "#{project.name} (#{project.current})"
  end

  def request_funding(rounds)
    puts "There are #{@projects.size} projects in #{@title}: "
    puts @projects

    1.upto(rounds) do |round|
      puts "\nFunding Round #{round}:"
      @projects.each do |project|
        FundingRound.funding_turns(project)
        puts project
      end
    end
  end

  def print_stats
    fully_funded, under_funded = @projects.partition { |project| project.fully_funded? }

    puts "\n#{@title} Funding Statistics:"

    puts "\n#{fully_funded.size} fully-funded project(s):"
    fully_funded.each do |project|
      print_name_and_current(project)
    end

    puts "\n#{under_funded.size} under-funded project(s):"
    under_funded.each do |project|
      print_name_and_current(project)
    end

    puts "\n#{@title} Still Needs Contributions:"
    @projects.sort.each do |project|
      formatted_name = project.name.ljust(20, '.')
      puts "#{formatted_name} #{project.need}"
    end
  end
end
