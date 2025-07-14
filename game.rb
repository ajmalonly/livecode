class Player
  attr_accessor :name, :score

  def initialize(name, score = 0)
    @name = name
    @score = score
  end

  def to_s
    "Name: #{@name} - Score: #{@score}"
  end
end

class Scoreboard
  def initialize
    @players = []
  end

  def add_player
    print "Enter player name: "
    name = gets.chomp
    @players << Player.new(name)
    puts "✅ Player '#{name}' added."
  end

  def list_players
    if @players.empty?
      puts "📭 No players registered."
    else
      puts "\n🏆 Player List:"
      @players.each_with_index do |player, index|
        puts "#{index + 1}. #{player}"
      end
    end
  end

  def update_score
    print "Enter player name: "
    name = gets.chomp
    player = @players.find { |p| p.name == name }

    if player
      print "Enter score to add (use negative to subtract): "
      change = gets.chomp.to_i
      player.score += change
      puts "✏️ Updated score for #{player.name}: #{player.score}"
    else
      puts "❌ Player not found."
    end
  end

  def remove_player
    print "Enter player name to remove: "
    name = gets.chomp
    player = @players.find { |p| p.name == name }

    if player
      @players.delete(player)
      puts "🗑️ Player '#{name}' removed."
    else
      puts "❌ Player not found."
    end
  end

  def menu_loop
    loop do
      puts "\n🎮 Game Scoreboard Menu"
      puts "1. Add player"
      puts "2. List players"
      puts "3. Update player score"
      puts "4. Remove player"
      puts "5. Exit"
      print "Choose an option: "
      choice = gets.chomp

      case choice
      when "1" then add_player
      when "2" then list_players
      when "3" then update_score
      when "4" then remove_player
      when "5"
        puts "👋 Goodbye!"
        break
      else
        puts "⚠️ Invalid option. Try again."
      end
    end
  end
end

# Run the program
scoreboard = Scoreboard.new
scoreboard.menu_loop
