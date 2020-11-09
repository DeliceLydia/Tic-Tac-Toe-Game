#!/usr/bin/env ruby

# VARIABLES
board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

# METHODS
def display_board(board)
  puts ''
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '--- --- ---'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '--- --- ---'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
  puts ''
end

# INTRO
puts ''
puts '================================'
puts 'Welcome to Tic Tac Toe game!'
puts '================================'
puts 'This is the description for the game'

puts "If you want to start the game, enter any key, to quit the game, enter 'q'"
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

# PLAYING

# display the latest board to player
display_board(board)
current_player = name1

# count the times for mockup temporarily
count = 0

loop do
  print "#{current_player}: Which position do you want to take?: "

  ## get the player input with validation
  position = gets.chomp.to_i

  ## Update the board with player symbol based on the player's input
  board[position - 1] = current_player == name1 ? '●' : '■'

  # BREAK REPEAT IF : for the mile stone 3
  # if win?
  #   display_board(board)
  #   puts 'Congratulations!'
  #   puts "#{current_player} is the winner!"
  #   puts ''
  #   break
  # elsif draw?
  #   display_board(board)
  #   puts 'Oops. The game is over!'
  #   puts ''
  #   break
  # end

  ## display updated board
  display_board(board)
  ## switch current player
  current_player = current_player == name1 ? name2 : name1

  # count the times for mockup temporarily
  count += 1
  # break depends on the count number temporarily
  next unless count == 7

  display_board(board)
  puts '================================'
  puts 'Congratulations!'
  puts "#{current_player} is the winner!"
  puts '================================'
  puts ''
  break
end

# END
puts "If you want to continue the game, enter any key, to quit the game, enter 'q'"
ans = gets.chomp.downcase
abort if ans == 'q'
