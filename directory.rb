@students = [] # an empty array accessible to all methods

def try_load_students
  filename = ARGV.first #first argument from the command line
  if filename == nil #if no file given in CL, default load students.csv
    default_load_students
    puts "Default Load: Loaded #{@students.count} #{plural?(@students.count)} from students.csv"
  elsif File.exists?(filename) #if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    exit #quit the program
  end
end

def interactive_menu
  try_load_students
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
    puts "Success. Student(s) added"
  when "2"
    show_students
    puts "Success. Student(s) showed"
  when "3"
    save_students
    puts "Success. Student(s) saved"
  when "4"
    load_students
    puts "Success. Student(s) loaded"
  when "9"
    exit #program terminates
  else
    puts "I dont know what you meant, try again"
  end
end

def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  #get the first name
  name = STDIN.gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    add_student_to_working_list(name)
    puts "Now we have #{@students.count} #{plural?(@students.count)}"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def plural?(n)
  n == 1 ? "student" : "students"
end


def print_header
  puts "The students of Villains Academy"
  puts "-----------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end
#nothing happens until we call the methods

def save_students
  puts "Save students to: "
  #open the file to writing
  file = File.open(gets.chomp, "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def default_load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    add_student_to_working_list(name, cohort)
  end
  file.close
end

def load_students(filename = "students.csv")
  puts "Load students from: "
  file = gets.chomp
  if !File.exists?(file)
    puts "File not found"
    return
  else
    file = File.open(file, "r")
    file.readlines.each do |line|
      name, cohort = line.chomp.split(",")
      add_student_to_working_list(name, cohort)
    end
  end
  file.close
end

def add_student_to_working_list(name, cohort = :november)
  @students << {name: name, cohort: cohort.to_sym}
end

interactive_menu
