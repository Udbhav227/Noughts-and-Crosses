# tic-tac-toe board
class Board
  attr_reader :cells

  WINNING_COMBINATION = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # columns
    [0, 4, 8], [2, 4, 6]             # diagonals
  ].freeze

  def initialize
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  # rubocop:disable Metrics/AbcSize
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]}"
    puts '---+---+---'
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]}"
    puts '---+---+---'
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]}"
  end
  # rubocop:enable Metrics/AbcSize

  def update_board(number, symbol)
    @cells[number - 1] = symbol
  end

  def valid_move?(number)
    cells[number - 1] == number
  end

  def full?
    cells.all? { |cell| cell.is_a?(String) }
  end

  def game_over?
    WINNING_COMBINATION.any? do |combo|
      [cells[combo[0]], cells[combo[1]], cells[combo[2]]].uniq.length == 1
    end
  end
end
