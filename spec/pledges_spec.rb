require_relative '../lib/pledges.rb'

describe Pledge do

  before do
    @pledge = Pledge.new(:gold, 100)
  end

  it "has name attribute" do
    expect(@pledge.name).to eq(:gold)
  end

  it "has a pledge amount" do
    expect(@pledge.amount).to eq(100)
  end

end

describe PledgeContribution do

  it "has three types of pledges" do
    expect(PledgeContribution::PLEDGES.size).to eq(3)
  end

  it "has a bronze pledge worth $50" do
    expect(PledgeContribution::PLEDGES[0]).to eq(Pledge.new(:bronze, 50))
  end

  it "has a silver pledge worth $75" do
    expect(PledgeContribution::PLEDGES[1]).to eq(Pledge.new(:silver, 75))
  end

  it "has a gold pledge worth $100" do
    expect(PledgeContribution::PLEDGES[2]).to eq(Pledge.new(:gold, 100))
  end

  it "returns a random pledge" do
    pledge = PledgeContribution.random

    expect(PledgeContribution::PLEDGES).to include(pledge)
  end
end
