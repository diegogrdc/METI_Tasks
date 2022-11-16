def print_menu
  puts "Choose what you want to do"
 puts "1: Enter rating points and comments"
 puts "2: Check results so far"
 puts "3: Quit"
end

def create_data
  puts "Please enter a rating from 1 to 5"
     point = gets.to_i
     while true
       if point <= 0 || point > 5
         puts "Please enter a rating from 1 to 5"
         point = gets.to_i
       else
         puts "Please enter a comment"
         comment = gets
         post = "Point: #{point} Comment: #{comment}"
         File.open("data.txt", "a") do |file|
           file. puts(post)
         end
         break
       end
     end
end

def print_data
  puts "result so far"
     File.open("data.txt", "r") do |file|
       file.each_line do |line|
         puts line
       end
     end
end

while true
   print_menu
   num = gets.to_i
   
   case num
    when 1
     create_data
   when 2
     print_data
   when 3
     puts "exit"
     break
   else
     puts "Please enter 1 to 3"
   end
end
