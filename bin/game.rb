class Game
  attr_reader :name, :move

  def initialize(name)
    @name = name
    @moves = []
  end

  @@poss_comb = [%w[1 2 3], %w[4 5 6], %w[7 8 9], %w[1 4 7],
                %w[2 5 8], %w[3 6 9], %w[1 5 9], %w[3 5 7]]

  @@count = 0

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

  def turn
    puts "#{name} choose your move >>"
    current_move(gets.chomp)
    Board.display
    puts "#{name} choose position #{move}"
    puts
    win
  end

  def win
    @@poss_comb.each do |arr|
      arr.each do |num|
        @@count += 1 if @moves.include?(num)
      end
      break if @@count == 3

      @@count = 0 if @@count < 3
    end
    puts @@count
    puts "You Win! #{name}" if @@count == 3
  end

  def self.begin(one, two)
    while @@count < 3
      one.turn if @@count < 3
      two.turn if @@count < 3
    end
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
