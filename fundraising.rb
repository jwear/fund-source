project1 = 'Cat Surgery'
project2 = 'Dog Surgery'
project3 = 'Animal Shelter and Rescue'
project4 = 'Vet Treatment Cost'

funding1 = 1000
funding2 = 5500
funding3 = 2800
funding4 = 4000

current_time = Time.new

puts "Project #{project1.capitalize} has $#{funding1} in funding."
puts "Project #{project2.upcase} has $#{funding2} in funding."
puts "Project #{project3.capitalize} has $#{funding3} in funding.".center(50, '*')
puts "Project #{project4.capitalize.ljust(40, '.')} has $#{funding4} in funding."

puts "Funding started on #{current_time.strftime("%A %m/%d/%Y at %I:%m%p")}."
