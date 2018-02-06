def day_time
  current_time = Time.new
  current_time.strftime("%A %m/%d/%Y at %I:%m%p")
end

# def titlecase(project)
#   "#{project.split.each{|project| project.capitalize!}.join(' ')}"
# end

def project_status(project, funding)
  "#{project.titlecase} has raised $#{funding} as of #{day_time}."
end

class String
  def titlecase
    "#{self.split.each{ |word| word.capitalize!}.join(' ')}"
  end
end

puts project_status("Cat Surgery", 1000)
puts project_status("Dog Surgery", 3500)
puts project_status("Vet Treatment", 2200)
puts project_status("Animal Rescue", 8000)
