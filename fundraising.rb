require_relative 'category'

project1 = Project.new("cat surgery", 500, 3000)
project2 = Project.new("vet treatment cost", 150, 2500)
project3 = Project.new("dog surgery", 1000, 5000)

animals = Category.new("Animals")
animals.add_project(project1)
animals.add_project(project2)
animals.add_project(project3)
animals.request_funding(2)
animals.print_stats
