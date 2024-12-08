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
    @board = Array.new(9, " ")
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

  
end