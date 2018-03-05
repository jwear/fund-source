require_relative '../lib/category'
require_relative '../lib/die'

describe Category do
  before do
    @category = Category.new("Animals")

    @current = 500
    @target = 3000
    @project = Project.new("cat surgery", @current, @target)

    @category.add_project(@project)
  end

  it "add funds to the project if the number rolled is even" do
    allow_any_instance_of(Die).to receive(:roll).and_return(6)

    @category.request_funding(2)

    expect(@project.current).to eq(@current + (25 * 2))
  end

  it "substract funds from the project if the the number rolled is odd" do
    allow_any_instance_of(Die).to receive(:roll).and_return(5)

    @category.request_funding(2)

    expect(@project.current).to eq(@current - (10 * 2))
  end
end
