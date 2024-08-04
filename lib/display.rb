# rubocop:disable Layout/LineLength

# Text needed for Tic-Tac-Toe
module Display
  def display_intro
    "Welcome to console Tic-Tac-Toe \n\n"
  end

  def display_instructions
    "Instruction: On your turn, you will be prompted to enter the number corresponding \nto the position on the grid where you want to place your mark."
  end

  def display_name_prompt(number)
    "What is the name of player ##{number}?"
  end

  def display_symbol_prompt
    'What 1 letter (or special character) would you like to be your game marker?'
  end

  def display_input_warning
    "\e[31mSorry, that is an invalid input. Please, try again.\e[0m"
  end

  def display_cell_occupied_warning
    "\e[31mInvalid move: Cell already occupied.\e[0m"
  end

  def display_player_turn(name, symbol)
    "#{name} ('#{symbol}') to play: "
  end

  def display_winner(player_name)
    "GAME OVER! #{player_name} is the winner!"
  end

  def display_tie
    "It's a draw!"
  end
end
# rubocop:enable Layout/LineLength
