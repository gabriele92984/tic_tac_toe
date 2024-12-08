puts <<~WELCOME
Welcome to Tic-Tac-Toe!
A game played taking your turn marking the spaces in a three-by-three grid with X or O.

The player who succeeds in placing three of their marks in a horizontal, vertical, or
diagonal row is the winner, there is a draw/tie when the entire board is filled with
X and O but no winning combinations can be found.

Please, in placing your move consider a board with squares identified as follows:

   1 | 2 | 3
  ---+---+---
   4 | 5 | 6
  ---+---+---
   7 | 8 | 9

Note: you cannot place a token on a square that is already taken.
WELCOME

class TicTacToe
  attr_accessor :board, :current_player

  def initialize
    @board = Array.new(9, " ") # Single array 9 element
    @current_player = "X"
  end

  def display_board
    puts ""
    puts "Current Board:"
    puts ""
    (0..2).each do |row|
      # Format each cell to be 3 characters wide, centered
      formatted_row = @board[row * 3, 3].map { |cell| " #{cell} " }.join("|")
      puts formatted_row
      puts "---+---+---" unless row == 2
    end
  end
  
  def play
    until game_over?
      display_board
      puts ''
      puts "Player #{@current_player}, enter your move (position from 1 to 9):"

      move = gets.chomp.to_i - 1 # Read input, strip whitespace, convert to int, adjust index

      if (0..8).include?(move) && valid_move?(move)
        make_move(move)
        switch_player
      else
        puts move.between?(0, 8) ? 'Invalid move. Please try again.' : 'Please enter a valid position (1-9).'
      end
    end

    display_board
    announce_result
  end

  private

  def valid_move?(move)
    @board[move] == ' '
  end

  def make_move(move)
    @board[move] = @current_player
  end

  def switch_player
    @current_player = @current_player == 'X' ? 'O' : 'X'
  end

  def game_over?
    winner || draw?
  end

  def winner
    winning_combinations.each do |combo|
      return @board[combo[0]] if combo.all? { |index| @board[index] == @board[combo[0]] && @board[index] != ' ' }
    end
    nil
  end

  def draw?
    @board.none? { |cell| cell == ' ' }
  end

  def winning_combinations
    [
      [0, 1, 2], # Top row
      [3, 4, 5], # Middle row
      [6, 7, 8], # Bottom row
      [0, 3, 6], # Left column
      [1, 4, 7], # Middle column
      [2, 5, 8], # Right column
      [0, 4, 8], # Diagonal \
      [2, 4, 6]  # Diagonal /
    ]
  end

  def announce_result
    if winner
      puts "Player #{winner} wins!"
    else
      puts "It's a draw!"
    end
  end
end