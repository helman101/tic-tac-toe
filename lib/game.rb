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

  def welcome
    puts 'Welcome to tic-tac-toe game'
    puts
    display
  end

  def display
    puts
    puts " #{@pos[0]} | #{@pos[1]} | #{@pos[2]} "
    puts '---+---+---'
    puts " #{@pos[3]} | #{@pos[4]} | #{@pos[5]} "
    puts '---+---+---'
    puts " #{@pos[6]} | #{@pos[7]} | #{@pos[8]} "
    puts
  end
end

class Game
  attr_reader :poss_comb, :player_one, :player_two
  attr_accessor :counter, :board, :first, :player, :taken_moves

  def initialize
    @first = true
    @player_one = set_player
    @player_two = set_player
    @board = Board.new
    @poss_comb = [%w[1 2 3], %w[4 5 6], %w[7 8 9], %w[1 4 7], %w[2 5 8], %w[3 6 9], %w[1 5 9], %w[3 5 7]]
    @counter = 0
    @player = curr_player
    @taken_moves = []
  end

  def start
    @board.welcome
    match
  end

  def set_player
    puts "Player #{@first ? 'one' : 'two'} name>>"
    my_player = Players.new(good_name(gets.chomp.capitalize))
    puts "Player #{my_player.name} plays with #{@first ? 'X' : 'O'} "
    puts
    @first = !@first
    my_player
  end

  def curr_player
    @first ? @player_one : @player_two
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

  def turn
    @player = curr_player
    puts "#{@player.name} choose your move >>"
    curr_move(good_move(gets.chomp))
    @board.display
    puts "#{@first ? 'Player one' : 'Player two'} #{@player.name} choose position #{@player.move}"
    puts
    win
    @first = !@first
  end

  def good_name(name)
    if name =~ /[a-zA-Z]/ && !name.length.zero? && name =~ /\S/
      name
    else
      puts 'Please use letters only'
      good_name(gets.chomp)
    end
  end

  def good_move(move)
    if !@taken_moves.include?(move) && move =~ /[1-9]/ && move.length == 1
      move
    else
      puts 'Please select a valid position'
      good_move(gets.chomp)
    end
  end

  def match
    while @counter < 3
      if !tie?
        turn
      else
        puts 'It\'s a Tie!!!'
        break
      end
    end
  end

  def tie?
    return true if @taken_moves.length == 9

    false
  end

  def win
    @poss_comb.each do |arr|
      arr.each do |num|
        @counter += 1 if @player.moves.include?(num)
      end
      break if @counter == 3

      @counter = 0 if @counter < 3
    end
    puts "You Win! #{@player.name}" if @counter == 3
  end
end
