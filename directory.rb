def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the stuents"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. read the input and save it into the variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit #program terminates
    else
      puts "I dont know what you meant, try again"
    end
  end
end


def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  # create an empty array
  studentsAr = []
  #get the first name
  name = gets[0..-2]
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    puts "Please enter #{name}'s cohort"
    cohort = gets.chomp
    cohort = 'Unknown'.to_sym if cohort == ""
    studentsAr << {name: name.to_sym, cohort: cohort.to_sym, height: :tall, gender: :male}
    puts "Now we have #{studentsAr.count} #{plural?(studentsAr.count)}"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  if !studentsAr.empty?
    return studentsAr
  end
end

def plural?(n)
  n == 1 ? "student" : "students"
end



def print_header
  puts "The students of Villains Academy"
  puts "-----------"
end

def output(students, cohort)
  studentsInCohort = []
  if !students
    return
  else
    students.each do |student|
      studentsInCohort << student[:name] if student[:cohort] == cohort.to_sym
    end
  end
  puts studentsInCohort
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
#nothing happens until we call the methods

interactive_menu
