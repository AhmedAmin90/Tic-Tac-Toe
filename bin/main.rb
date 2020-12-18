#!/usr/bin/env ruby
require_relative '../lib/game_logic'

puts 'The First player name : '
player_one = gets.chomp

puts 'The Second player name : '
player_two = gets.chomp

flag = false
game_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
arr = []
new_game = StartGame.new(player_one, player_two)
new_game.greeting
new_game.print_board(game_board)
win_draw_case = WinOrDraw.new

def check(number, player, game_board, arr)
  if (1..9).include?(number)
    if arr.include?(number) == true
      puts 'This number has been taken before! , please try another number'
      number = gets.chomp.to_i
      check(number, player, game_board, arr)
    else
      arr.push(number)
      game_board[number - 1] = if player == 1
                                 'X'
                               else
                                 'O'
                               end
    end
  else
    puts 'Invalid number'
    puts 'Please select number between 1 and 9'
    number = gets.chomp.to_i
    check(number, player, game_board, arr)
  end
end

def win_draw (player,flag,draw)
  if flag == true
    if draw == false
       puts "Congratulation #{player} ! You Win " 
    else
       puts 'DRAW !'
    end
  else
  puts "Continue in the game !"
   end
end



while flag == false

  puts "#{player_one} turn: Select number between 1 and 9"
  player_one_turn = gets.chomp.to_i
  check(player_one_turn, 1, game_board, arr)
  puts new_game.print_board(game_board)
  win_draw_case.game_status(game_board, flag)
  win_draw(player_one,win_draw_case.flag ,win_draw_case.draw )
  break if win_draw_case.flag == true

  puts "#{player_two} turn: Select number between 1 and 9"
  player_two_turn = gets.chomp.to_i
  check(player_two_turn, 2, game_board, arr)
  puts new_game.print_board(game_board)
  win_draw_case.game_status(game_board, flag )
  win_draw(player_two,win_draw_case.flag ,win_draw_case.draw)
  break if win_draw_case.flag == true


end
