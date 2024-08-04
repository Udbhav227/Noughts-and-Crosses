# Game setup
class Game
  include Display
  attr_reader :first_player, :second_player, :board, :current_player

  def initialize
    @board = Board.new
    @player1 = nil
    @player2 = nil
    @current_player = nil
  end

  def play
    game_set_up
    @current_player = @player1
    board.display
    start_game
  end

  private

  def start_game
    loop do
      print display_player_turn(@current_player.name, @current_player.symbol)
      input = gets.chomp.to_i
      if board.valid_move?(input)
        make_move(input, @current_player.symbol)
        break if game_over?
      else
        puts display_cell_occupied_warning
      end
    end
  end

  def game_over?
    if board.game_over?
      puts display_winner(@current_player.name)
      true
    elsif board.full?
      puts display_tie
      true
    else
      switch_player(@current_player)
      false
    end
  end

  def make_move(number, symbol)
    board.update_board(number, symbol)
    board.display
  end

  def switch_player(current_player)
    @current_player = current_player == @player1 ? @player2 : @player1
  end

  def game_set_up
    @player1 = player_set_up(1, nil)
    @player2 = player_set_up(2, @player1.symbol)
    puts display_instructions
  end

  def player_set_up(number, symbol)
    puts display_name_prompt(number)
    name = gets.chomp
    puts display_symbol_prompt
    symbol = symbol_set_up(symbol)
    Player.new(name, symbol)
  end

  def symbol_set_up(prev_symbol)
    symbol = gets.chomp
    return symbol if symbol.match?(/[^0-9]$/) && prev_symbol != symbol

    puts display_input_warning
    symbol_set_up(prev_symbol)
  end
end
