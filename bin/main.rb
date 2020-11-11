#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/player.rb'
require_relative '../lib/board.rb'
require_relative '../lib/game.rb'

game = Game.new
game.display_instruction
abort if game.player_answer == 'q'

loop do
  name1, name2 = game.players_name
  game_board = Board.new
  player1 = Player.new(name1, '●')
  player2 = Player.new(name2, '■')

  game.display_name_symbol(player1, player2)
  game.display_board(game_board.board)
  current_player = player1

  game.game_play(current_player, game_board, player1, player2)
  break if game.player_answer == 'q'
end
