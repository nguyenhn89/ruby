require_relative "lib/services/user_service"

service = UserService.new

def menu
  puts "\n=== USER MANAGEMENT ==="
  puts "1. Create user"
  puts "2. List users"
  puts "3. Find user"
  puts "4. Update user"
  puts "5. Delete user"
  puts "0. Exit"
  print "Choose: "
end

loop do
  menu
  choice = gets.chomp.to_i

  case choice
  when 1
    print "Name: "
    name = gets.chomp

    print "Age: "
    age = gets.chomp.to_i

    user = service.create(name, age)
    puts "Created: #{user}"

  when 2
    users = service.all
    puts "\nUsers:"
    users.each { |u| puts u }

  when 3
    print "Enter ID: "
    id = gets.chomp.to_i

    user = service.find(id)
    puts user ? user : "Not found"

  when 4
    print "Enter ID: "
    id = gets.chomp.to_i

    print "New name (blank skip): "
    name = gets.chomp
    name = nil if name.empty?

    print "New age (blank skip): "
    age_input = gets.chomp
    age = age_input.empty? ? nil : age_input.to_i

    user = service.update(id, name: name, age: age)
    puts user ? "Updated: #{user}" : "Not found"

  when 5
    print "Enter ID: "
    id = gets.chomp.to_i

    if service.delete(id)
      puts "Deleted"
    else
      puts "Not found"
    end

  when 0
    puts "Bye!"
    break

  else
    puts "Invalid choice"
  end
end