#!/usr/bin/env ruby
require_relative '../lib/player.rb'
require_relative '../lib/board.rb'

def display_board(board)
  puts ''
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '--- --- ---'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '--- --- ---'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
  puts ''
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
    break if (1..9).include?(position) && !board[position - 1].is_a?(String)

    print 'Please enter valid number from 1 to 9: ' unless (1..9).include?(position)
    print "It's already taken. Please choose another position: " if board[position - 1].is_a?(String)
    position = gets.chomp.to_i
  end
  position
end

def switched_player(current_player, player1, player2)
  current_player == player1 ? player2 : player1
end

def player_answer
  puts "If you want to continue the game, enter any key, to quit the game, enter 'q'"
  ans = gets.chomp.downcase
  ans
end

def display_name_symbol(player1, player2)
  puts "#{player1.name} will be using '#{player1.symbol}'"
  puts "#{player2.name} will be using '#{player2.symbol}'"
end

loop do
  display_title
  abort if player_answer == 'q'

  name1, name2 = players_name

  game_board = Board.new
  player1 = Player.new(name1, '●')
  player2 = Player.new(name2, '■')

  display_name_symbol(player1, player2)
  display_board(game_board.board)
  current_player = player1

  loop do
    print "#{current_player.name}: Which position do you want to take?: "

    position = gets.chomp.to_i
    position = validated_position(position, game_board.board)

    game_board.update_board(current_player, position, player1, player2)

    if game_board.win?
      display_board(game_board.board)
      puts 'Congratulations!'
      puts "#{current_player.name} is the winner!"
      puts ''
      break
    elsif game_board.draw?
      display_board(game_board.board)
      puts 'Oops. The game is over!'
      puts ''
      break
    end

    display_board(game_board.board)
    current_player = switched_player(current_player, player1, player2)
  end

  break if player_answer == 'q'
end
