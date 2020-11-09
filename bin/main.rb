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

def draw?(board)
  board.all? { |x| x.is_a?(String) }
end

def win?(board)
  combinations = [
    [board[0], board[1], board[2]],
    [board[3], board[4], board[5]],
    [board[6], board[7], board[8]],
    [board[0], board[3], board[6]],
    [board[1], board[4], board[7]],
    [board[2], board[5], board[8]],
    [board[0], board[4], board[8]],
    [board[2], board[4], board[6]]
  ]
  combinations.any? do |comb|
    comb.all? { |x| x == '●' } || comb.all? { |x| x == '■' }
  end
end

def display_title
  puts ''
  puts '================================'
  puts 'Welcome to Tic Tac Toe game!'
  puts '================================'
  puts 'This is the description for the game'
end

def validated_name(name)
  loop do
    break unless name.strip == ''

    print 'Blank can not be used. Enter the correct name: '
    name = gets.chomp
  end
  name
end

def players_name
  print 'Enter the player 1 name: '
  name1 = gets.chomp
  name1 = validated_name(name1)
  print 'Enter the player 2 name: '
  name2 = gets.chomp
  name2 = validated_name(name2)
  [name1, name2]
end

def validated_position(position, board)
  loop do
    print 'Please enter valid number from 1 to 9: ' unless (1..9).include?(position)
    print "It's already taken. Please choose another position: " if board[position - 1].is_a?(String)
    position = gets.chomp.to_i
    break if (1..9).include?(position) && !board[position - 1].is_a?(String)
  end
  position
end

# INTRO
display_title

puts "If you want to start the game, enter any key, to quit the game, enter 'q'"
ans = gets.chomp.downcase
abort if ans == 'q'

name1, name2 = players_name

# print the names and symbols to each player
puts "#{name1} will be using '●', #{name2} will be using '■'"

# For Mile Stone 3
# >> create player instance with names
# >> create Board instance

# PLAYING

# display the latest board to player
display_board(board)
current_player = name1

loop do
  print "#{current_player}: Which position do you want to take?: "

  ## get the player input with validation
  position = gets.chomp.to_i
  position = validated_position(position, board)

  ## Update the board with player symbol based on the player's input
  board[position - 1] = current_player == name1 ? '●' : '■'

  # BREAK REPEAT IF : for the mile stone 3
  if win?(board)
    display_board(board)
    puts 'Congratulations!'
    puts "#{current_player} is the winner!"
    puts ''
    break
  elsif draw?(board)
    display_board(board)
    puts 'Oops. The game is over!'
    puts ''
    break
  end

  ## display updated board
  display_board(board)
  ## switch current player
  current_player = current_player == name1 ? name2 : name1
end

# END
puts "If you want to continue the game, enter any key, to quit the game, enter 'q'"
ans = gets.chomp.downcase
abort if ans == 'q'
