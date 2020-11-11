# frozen_string_literal: true

class Board
  attr_accessor :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @combinations = [
      [@board[0], @board[1], @board[2]],
      [@board[3], @board[4], @board[5]],
      [@board[6], @board[7], @board[8]],
      [@board[0], @board[3], @board[6]],
      [@board[1], @board[4], @board[7]],
      [@board[2], @board[5], @board[8]],
      [@board[0], @board[4], @board[8]],
      [@board[2], @board[4], @board[6]]
    ]
  end

  def draw?
    @board.all? { |x| x.is_a?(String) }
  end

  def win?
    @combinations.any? do |comb|
      comb.all? { |x| x == '●' } || comb.all? { |x| x == '■' }
    end
  end

  def update_board(current_player, position, player1, player2)
    @board[position - 1] = current_player == player1 ? player1.symbol : player2.symbol
  end
end
