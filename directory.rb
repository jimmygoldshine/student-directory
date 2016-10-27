# let's put all students into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Kreuger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
# and then prints them
puts "The students of Villains Academy"
puts "-----------"
students.each do |student|
  puts student
end

# finally, we print total
puts "Overall, we have #{students.count} great students"
