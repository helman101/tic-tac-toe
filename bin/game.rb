possible_combinations = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

class Players
  attr_reader :name
  def initialize(name)
    @name = name
    @moves = []
  end

  def current_move(move)
    @move = move
    @moves << @move
  end
end

class Game
  class Board
    @@var1 = "1"
    @@var2 = "2"
    @@var3 = "3"
    @@var4 = "4"
    @@var5 = "5"
    @@var6 = "6"
    @@var7 = "7"
    @@var8 = "8"
    @@var9 = "9"

    def self.display
      puts " #{@@var1} | #{@@var2} | #{@@var3} "
      puts '---+---+---'
      puts " #{@@var4} | #{@@var5} | #{@@var6} "
      puts '---+---+---'
      puts " #{@@var7} | #{@@var8} | #{@@var9} "
    end
  end
end
