require_relative 'deck'
require_relative 'card'
require 'pry'

class HighLow
  attr_accessor :player, :deck

  @@balance = 0
  @@bet = 0
  @@guess = nil
  @@faceup_card = nil
  @@facedown_card = nil
  @@hilo = nil


  def initialize(player)
    @player = player
    @deck = Deck.new
    puts
    puts "HIGHLOW"
    initial_roll
    play_game
  end

  def play_game
    make_a_bet
    deal
    make_a_play
    check
    reset
    puts "Your remaining bankroll: $#{@@balance}"
    play_game
  end

  def initial_roll
    puts "What is your initial bankroll?"
    @@balance = gets.chomp.to_i
    @player.balance -= @@balance
  end

  def add_from_wallet
    puts "Do you want to add more ?"
    @@balance = gets.chomp.to_i
    @player.balance -= @@balance
  end

  def deal
    @deck.shuffle_cards
    # binding.pry
    @@faceup_card = @deck.cards.sample
    puts
    puts "Card 1: #{@@faceup_card.rank} #{@@faceup_card.suit}"
    puts "Card 2: FACEDOWN"
    @@facedown_card = @deck.cards.sample
  end

  def make_a_bet
    puts "Your bet:"
    if @@balance >= @@bet
      @@bet = gets.chomp.to_i
    else 
      puts "You don't got enough.sorry"
    end
  end

  def make_a_play
    puts "Guess. High or low? H/L" 
    choice = gets.chomp.to_s.upcase
    case choice 
    when 'H'
      @@guess = 'high'
    when 'L'
      @@guess = 'low'
    else
      puts "Invalid choce.Try again"
      make_a_play
    end

    puts "Your guess: #{@@guess.capitalize}"
  end

  def compare_cards
    if @deck.ranks.index(@@faceup_card.rank) < @deck.ranks.index(@@facedown_card.rank)
      @@hilo = 'high'
    elsif 
      @deck.ranks.index(@@faceup_card.rank) > @deck.ranks.index(@@facedown_card.rank)
      @@hilo = 'low'
    else 
      @@hilo = 'equal'
    end
  end

  def check
    compare_cards
    puts
    puts "#{@@faceup_card.rank} #{@@faceup_card.suit}"
    puts "#{@@facedown_card.rank} #{@@facedown_card.suit}"
    if @@guess == @@hilo
      win
    else
      loose
    end
  end

  def win
    puts
    puts "You Won!"
    @@balance += @@bet
  end
  
  def draw
    puts
    puts "Draw.Try again"
    play_game
  end

  def loose 
    puts
    puts "Sorry, dealer won"
    @@balance -= @@bet
  end

  def reset
    @@bet = 0
    @@faceup_card = nil
    @@facedown_card = nil
    @@guess = nil
    @@hilo = nil
  end

end