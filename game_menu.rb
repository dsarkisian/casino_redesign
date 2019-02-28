require_relative 'highlow'

class GameMenu
  attr_accessor :player
  
  def initialize(player)
    @player = player
    choose_from_menu 
  end

  def display_menu
    puts
    puts "Select a game:"
    puts '1) High/Low'
    puts '2) Slots'
    puts '3) Player Menu'
    puts '3) Main Menu'
    puts "Good Luck!"
  end

  def choose_from_menu
    display_menu
    choice = gets.to_i
    case choice
    when 1
      high_low = HighLow.new(@player)
    when 2
      puts "sorry, I did not get to develop this game. 
      Please, play High Low.
      Good luck =D "
      high_low = HighLow.new(@player)
    when 3
      puts
      @player.choose_from_menu
    when 4
      puts
      puts "Goodbye"
      main_menu = MainMenu.new
    else
      puts 'invalid choice, please try again'
      choose_from_menu
    end
  end
end


