
def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    puts "Please enter #{name}'s cohort"
    cohort = gets.chomp
    cohort = 'Unknown'.to_sym if cohort == ""
    students << {name: name.to_sym, cohort: cohort.to_sym, height: :tall, gender: :male}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end

  # return the array of students
  print students
end

def print_header
  puts "The students of Villains Academy"
  puts "-----------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort) (Height: #{student[:height]}) (Gender: #{student[:gender]})".center(100)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
#print(students)
print_footer(students)
