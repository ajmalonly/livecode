# flight_checkin.rb

passengers = []

def show_menu
  puts "\n🛫 Flight Check-in Manager"
  puts "1. Add a passenger"
  puts "2. List all passengers"
  puts "3. Update passenger seat"
  puts "4. Remove a passenger"
  puts "5. Exit"
  print "Choose an option (1-5): "
end

def add_passenger(passengers)
  print "Enter passenger name: "
  name = gets.chomp
  print "Enter passport number: "
  passport = gets.chomp
  print "Enter seat number (e.g., 12A): "
  seat = gets.chomp

  passenger = {
    "name" => name,
    "passport" => passport,
    "seat" => seat
  }

  passengers << passenger
  puts "✅ #{name} has been checked in with seat #{seat}."
end

def list_passengers(passengers)
  if passengers.empty?
    puts "📭 No passengers have checked in yet."
  else
    puts "\n📋 Passenger List:"
    passengers.each_with_index do |passenger, index|
      puts "#{index + 1}. #{passenger["name"]} (Passport: #{passenger["passport"]}) - Seat: #{passenger["seat"]}"
    end
  end
end

def update_seat(passengers)
  print "Enter passport number of the passenger: "
  passport = gets.chomp

  passenger = passengers.find { |p| p["passport"] == passport }

  if passenger
    print "Enter new seat number: "
    new_seat = gets.chomp
    passenger["seat"] = new_seat
    puts "✏️ Seat updated for #{passenger["name"]}. New seat: #{new_seat}"
  else
    puts "❌ Passenger not found."
  end
end

def remove_passenger(passengers)
  print "Enter passport number of the passenger to remove: "
  passport = gets.chomp

  removed = passengers.reject! { |p| p["passport"] == passport }

  if removed
    puts "🗑️ Passenger removed from the list."
  else
    puts "❌ Passenger not found."
  end
end

# Main program loop
loop do
  show_menu
  choice = gets.chomp

  case choice
  when "1"
    add_passenger(passengers)
  when "2"
    list_passengers(passengers)
  when "3"
    update_seat(passengers)
  when "4"
    remove_passenger(passengers)
  when "5"
    puts "👋 Exiting. Safe travels!"
    break
  else
    puts "⚠️ Invalid choice. Please try again."
  end
end
