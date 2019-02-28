require_relative 'player_menu'

class Player

  attr_accessor :name, :balance

  def initialize(name, balance)
    @name = name
    @balance = balance
  end
end
