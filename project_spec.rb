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
    expect(@project.to_s).to eq("Project Cat Surgery has $500 in funding towards a goal of $3000.")
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

  context "checks if the project is fully funded" do
    before do
      @project = Project.new("cat surgery", 3000, 3000)
    end

    it "checks if target fund minus current fund is equal to 0 " do
      expect(@project).to be_fully_funded
    end
  end

  context "checks if the project is not fully funded" do
    before do
      @project = Project.new("cat surgery", 2500, 3000)
    end

    it "checks if target fund is greater than current fund" do
      expect(@project).not_to be_fully_funded
    end
  end

  context "in a collection of projects" do
    before do
      @project1 = Project.new("cat surgery", 2900, 3000)
      @project2 = Project.new("vet treatment cost", 1500, 3000)
      @project3 = Project.new("dog surgery", 500, 3000)

      @projects = [@project1, @project2, @project3]
    end

    it "is sorted by decreasing amount oustanding" do
      expect(@projects.sort).to eq([@project3, @project2, @project1])
    end
  end
end
