#!/usr/bin/env ruby
# rubocop:disable Metrics/BlockNesting
require_relative '../lib/game_logic'
require 'rainbow'

puts Rainbow('Welcome to Tic Tac Toe Game !').italic.bold.orange
puts Rainbow('These are the game instructions:
    1- The board contains 9 boxes each box has its nubmer from 1 to 9.
    2- The player one will have X sign.
    3- The player two will have O sign.
    4- Each player has to select a number on the board between 1 and 9.
    The number automatically will change to the sign of the player (X or O).
    5- If the player select a number outside the range or a position is already taken,
    the game will show that the player need to select another number.
    6- The player who succeeds in placing three of their marks in a diagonal, horizontal, or vertical row is the winner.
    7- When all 9 squares are full, the game is over. If no player has success condition, the game ends in a draw.
    ').bold.white
puts Rainbow('************ Enjoy The Game ************ ').italic.yellow

puts Rainbow('The First player name : ').green
player_one = Rainbow(gets.chomp).bold.blue

puts Rainbow('The Second player name : ').green
player_two = Rainbow(gets.chomp).bold.purple

flag = false
game_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
arr = []
new_game = StartGame.new(player_one, player_two)
puts new_game.greeting
puts new_game.print_board(game_board)
win_draw_case = WinOrDraw.new

while flag == false

  puts "#{player_one} turn: Select number between 1 and 9"
  player_one_turn = gets.chomp.to_i
  move = true
  while move
    if (1..9).include?(player_one_turn)
      if arr.include?(player_one_turn) == true
        puts Rainbow('This number has been taken before! , please try another number').bold.yellow
        player_one_turn = gets.chomp.to_i
      else
        check(player_one_turn, 1, game_board, arr)
        move = false
        break
      end
    else
      puts Rainbow('Invalid number').bold.red
      puts Rainbow('Please select number between 1 and 9').yellow
      player_one_turn = gets.chomp.to_i
    end
  end
  # check(player_one_turn, 1, game_board, arr)
  puts new_game.print_board(game_board)
  win_draw_case.game_status(game_board, flag)
  puts win_draw(player_one, win_draw_case.flag, win_draw_case.draw)
  break if win_draw_case.flag == true

  puts "#{player_two} turn: Select number between 1 and 9"
  player_two_turn = gets.chomp.to_i
  move = true
  while move
    if (1..9).include?(player_two_turn)
      if arr.include?(player_two_turn) == true
        puts Rainbow('This number has been taken before! , please try another number').bold.yellow
        player_two_turn = gets.chomp.to_i
      else
        check(player_two_turn, 2, game_board, arr)
        move = false
        break
      end
    else
      puts Rainbow('Invalid number').bold.red
      puts Rainbow('Please select number between 1 and 9').yellow
      player_two_turn = gets.chomp.to_i
    end
  end
  # check(player_two_turn, 2, game_board, arr)
  puts new_game.print_board(game_board)
  win_draw_case.game_status(game_board, flag)
  puts win_draw(player_two, win_draw_case.flag, win_draw_case.draw)
  break if win_draw_case.flag == true

end

# rubocop:enable Metrics/BlockNesting
