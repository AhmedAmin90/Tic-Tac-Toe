#!/usr/bin/env ruby
require_relative '../lib/game_logic'

puts 'Name of First Player : '
player_one = gets.chomp

puts 'Name of Seconde Player : '
player_two = gets.chomp

flag = false
game_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
arr = []
new_game = StartGame.new(player_one, player_two)
new_game.greeting
new_game.print_board(game_board)

while flag == false

  puts "#{player_one} turn: Select number between 1 To 9"
  player_one_turn = gets.chomp.to_i
  new_game.check(player_one_turn, 1, game_board, arr)
  new_game.game_status(game_board, player_one, flag)
  break if new_game.flag == true

  puts "#{player_two} turn: Select number between 1 To 9"
  player_two_turn = gets.chomp.to_i
  new_game.check(player_two_turn, 2, game_board, arr)
  new_game.game_status(game_board, player_two, flag)
  break if new_game.flag == true

end
