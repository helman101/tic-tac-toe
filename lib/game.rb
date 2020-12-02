class Players
  attr_reader :name, :moves
  attr_accessor :move

  def initialize(name)
    @name = name
    @move = 0
    @moves = []
  end
end

class Board
  attr_accessor :pos

  def initialize
    @pos = %w[1 2 3 4 5 6 7 8 9]
  end
end

class Game
  attr_reader :poss_comb, :player_one, :player_two
  attr_accessor :counter, :board, :first, :player, :taken_moves

  def initialize(player_one, player_two)
    @first = true
    @player_one = player_one
    @player_two = player_two
    @board = Board.new
    @poss_comb = [%w[1 2 3], %w[4 5 6], %w[7 8 9], %w[1 4 7], %w[2 5 8], %w[3 6 9], %w[1 5 9], %w[3 5 7]]
    @counter = 0
    @player = curr_player
    @taken_moves = []
  end

  def start
    @board.welcome
  end

  def curr_player
    @first ? player_one : player_two
  end

  def curr_move(num)
    @player.move = num
    @player.moves << num
    @taken_moves << num
    @board.pos = @board.pos.map do |var|
      if var == num
        var.sub(var, (@first ? 'X' : 'O'))
      else
        var
      end
    end
  end

  def match
    turn until @counter == 3 || tie?
  end

  def tie?
    return true if @taken_moves.length == 9

    false
  end

  def win?
    @counter == 3
  end

  def win
    @poss_comb.each do |arr|
      arr.each do |num|
        @counter += 1 if @player.moves.include?(num)
      end
      break if @counter == 3

      @counter = 0 if @counter < 3
    end
  end
end
