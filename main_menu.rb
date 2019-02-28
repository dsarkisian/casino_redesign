
class MainMenu

  @@menu_options = [
    'New player',
    'Switch Players',
    'Exit Casino'
  ]

  def initialize
    choose_from_menu
  end

  def display_menu
    puts
    puts "WELCOME TO OUR CASINO. PLEASE SELECT: "

    @@menu_options.each_with_index do |option,i|
      print " #{i+1}: #{option}"
      puts
    end
  end

  def choose_from_menu
    players = []
    display_menu
    choice = gets.chomp.to_i
    case choice 
      when 1
        puts 
        puts "Enter new players name"
        new_player_name = gets.chomp
        puts "How much money is the player coming in with?"
        balance = gets.to_i
        player = Player.new(new_player_name, balance)
        players << player
        player_menu = PlayerMenu.new(player)
      when 2
        p players[0]
        puts
        puts "select player"
        sel = gets.chomp.to_i
        player_menu = PlayerMenu.new(players[sel-1])
      when 3
        puts "Goodbye" 
        exit
      else 
        puts
        puts "Invalid choice. Please try again"
        choose_from_menu
    end
  end
end
