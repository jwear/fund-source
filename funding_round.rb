require_relative 'project'
require_relative 'die'

module FundingRound
  def self.funding_turns(project)
    die = Die.new
    number_rolled = die.roll
    if number_rolled.even?
      project.add
    else
      project.subtract
    end
  end
end
