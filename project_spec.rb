require_relative 'project'

describe Project do

  before do
    $stdout = StringIO.new
    @current = 500
    @target = 3000
    @project = Project.new("cat surgery", @current, @target)
  end

  it "has a capitalized name" do
    expect(@project.name).to eq("Cat Surgery")
  end

  it "has a current funding amount" do
    expect(@project.current).to eq(@current)
  end

  it "has a string representation" do
    expect(@project.to_s).to eq("Project Cat Surgery has $500 in funding towards a goal of $3000.\nThe project still needs $2500 to reach the goal.")
  end

  it "has an initial target funding amount" do
    expect(@project.target).to eq(@target)
  end

  it "computes the total funding outstanding as the target funding amount minus the funding amount" do
    expect(@project.need).to eq(@target - @current)
  end

  it "increases funds by 25 when funds are added" do
    @project.add

    expect(@project.current).to eq(@current + 25)
  end

  it "decreases funds by 10 when funds are subracted" do
    @project.subtract

    expect(@project.current).to eq(@current - 10)
  end

  context "created with a defaul funding amount" do
    before do
      @project = Project.new("dog surger", 5000)
    end

    it "has a default value of 0 for funding amount" do
      expect(@project.current).to eq(0)
    end
  end
end
