#!/usr/bin/env ruby

# --------------------------
# METHODS

# --------------------------
def display_board(board)
puts ''
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts '--- --- ---'
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts '--- --- ---'
puts " #{board[6]} | #{board[7]} | #{board[8]} "
puts ''
end
# --------------------------
# INTRO
# --------------------------
# display the game title
puts ''
puts '============ Welcome to Tic Tac Toe game! ============'
# display welcome message and give a brief explanation of the game to players
puts 'How to play the game, Lorem ipsum, dolor sit amet consectetur adipisicin.'
# get the player input action to start the game
puts "If you want to start the game, enter any key, to quit the game, enter 'q'"
# if player want to quit the game, quit (abort)
ans = gets.chomp.downcase
abort if ans == 'q'

# get the player 1 name with validation
print 'Enter the player 1 name: '
name1 = gets.chomp

# get the player 2 name with validation
print 'Enter the player 2 name: '
name2 = gets.chomp

# print the names and symbols to each player
puts "#{name1} will be using '●', #{name2} will be using '■'"

# For Mile Stone 3
# >> create player instance with names
# >> create Board instance

# --------------------------
# PLAYING
# --------------------------

board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

# display the latest board to player
display_board(board)

# set the default current_player
current_player = name1

# START LOOP
loop do
  ## ask player which position player want to take with player name
  puts "#{current_player}: Which position do you want to take?"

  ## get the player input with validation
  position = gets.chomp.to_i

  ## Update the board with player symbol based on the player's input
  board[position - 1] = current_player == name1 ? '●' : '■'

  # BREAK REPEAT IF
  if win?
    display_board(board)
    puts "#{current_player} is a winner"
    break
  elsif draw?
    display_board(board)
    puts "The game is over!"
    break
  end
  # either player win or the board is filled with player's taking
  # display_board(board) to show result
  # If either player win, display winner elsif the borad is filled with, display 'draw the game!'

  ## display updated board
  ## switch current player
  display_board(board)
  current_player = current_player == name1 ? name2 : name1
  # END LOOP
end
puts "If you want to continue the game, enter any key, to quit the game, enter 'q'"
# if player want to quit the game, quit (abort)
ans = gets.chomp.downcase
abort if ans == 'q'
# --------------------------
# END
# --------------------------
# ask player if player want to continue or quit
# get the player answer
# BREAK IF answer is to quit, other wise, restart the game again
