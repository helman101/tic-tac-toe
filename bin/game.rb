possible_combinations = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

class Game
  attr_reader :name, :move

  def initialize(name)
    @name = name
    @moves = []
  end

  @@pos = %w[1 2 3 4 5 6 7 8 9]

  @@player_one = true

  def current_move(move)
    @move = move
    @moves << @move
    choosen_move(@move)
  end

  def choosen_move(move)
    @@pos = @@pos.map do |var|
      if var == move
        var.sub(var, (@@player_one ? 'X' : 'O'))
      else
        var
      end
    end
    @@player_one = !@@player_one
  end
end

class Board < Game
  def self.start
    puts 'Welcome to tic-tac-toe game'
    puts
    puts ' 1 | 2 | 3 '
    puts '---+---+---'
    puts ' 4 | 5 | 6 '
    puts '---+---+---'
    puts ' 7 | 8 | 9 '
    puts
  end

  def self.display
    puts
    puts " #{@@pos[0]} | #{@@pos[1]} | #{@@pos[2]} "
    puts '---+---+---'
    puts " #{@@pos[3]} | #{@@pos[4]} | #{@@pos[5]} "
    puts '---+---+---'
    puts " #{@@pos[6]} | #{@@pos[7]} | #{@@pos[8]} "
    puts
  end
end

class Players < Game
end
