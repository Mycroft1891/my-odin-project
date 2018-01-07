class Board

  attr_reader :grid, :game_over, :winner
  # winning = 0,1,2 || 3,4,5 || 6,7,8 done
  # winning = 0,3,6 || 1,4,8 || 2,5,8 done
  # winning = 0,4,8 || 2,4,6

  def initialize
    @game_over = false
    @grid = [[' ',' ',' '],
             [' ',' ',' '],
             [' ',' ',' ']]
  end

  def saveMove(pos, marker)
    @grid[2][pos - 7] = marker if (pos < 9 && pos > 6)
    @grid[1][pos - 4] = marker if (pos < 7 && pos > 3)
    @grid[0][pos - 1] = marker if (pos < 4 && pos > 0)

    @game_over = true if @winner = find_winner
    puts @grid.map { |line| line.join(' | ')}.join("\n")
  end

  def find_winner
    cross_1 = [@grid[0][0], @grid[1][1], @grid[2][2]].join
    return cross_1[0] if (cross_1 == "XXX" || cross_1 == "OOO")
    cross_2 = [@grid[0][2], @grid[1][1], @grid[2][0]].join
    return cross_2[0] if (cross_2 == "XXX" || cross_2 == "OOO")

    horizontal_1 = [@grid[0][0], @grid[0][1], @grid[0][2]].join
    return horizontal_1[0] if (horizontal_1 == "XXX" || horizontal_1 == "OOO")
    horizontal_2 = [@grid[1][0], @grid[1][0], @grid[1][2]].join
    return horizontal_2[0] if (horizontal_2 == "XXX" || horizontal_2 == "OOO")
    horizontal_3 = [@grid[2][0], @grid[2][1], @grid[2][2]].join
    return horizontal_3[0] if (horizontal_3 == "XXX" || horizontal_3 == "OOO")

    vertical_1 = [@grid[0][0], @grid[1][0], @grid[2][0]].join
    return vertical_1[0] if (vertical_1 == "XXX" || vertical_1 == "OOO")
    vertical_2 = [@grid[0][1], @grid[1][1], @grid[2][1]].join
    return vertical_2[0] if (vertical_2 == "XXX" || vertical_2 == "OOO")
    vertical_3 = [@grid[0][2], @grid[1][2], @grid[2][2]].join
    return vertical_3[0] if (vertical_3 == "XXX" || vertical_3 == "OOO")
  end

  # def check_moves
  #   # cross check
  #   cross_1 =  [@grid[0][0], @grid[1][1], @grid[2][2]]
  #   if cross.size == 3 && cross_1.uniq.size == 1
  #     return @grid[0][0]
  #   end
  #
  #   cross_2 = [@grid[0][2], @grid[1][1], @grid[2][0]]
  #   if cross_2.size == 3 && cross_2.uniq.size == 1
  #     return @grid[2][0]
  #   end
  #
  #   # horizontal check
  #   for i in 0..2 do
  #     if @grid[i].size == 3 && @grid[i].uniq.size == 1
  #       return @grid[i].uniq.join
  #     end
  #
  #     # vertical check
  #     vertical = []
  #     for j in 0..2 do
  #       vertical.push(@grid[j][i])
  #     end
  #
  #     return vertical.uniq.join if vertical.uniq.size == 1
  #     vertical = []
  #   end
  # end
end
