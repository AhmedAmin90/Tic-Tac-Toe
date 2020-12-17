#!/usr/bin/env ruby
puts 'The First player name : '
player_one = gets.chomp

puts 'The Second Player Name : '
player_two = gets.chomp

class StartGame
  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @sign_x = 'X'
    @sign_o = 'O'
  end

  def greeting
    puts "
        |Welcome to Tic Tac Toe game,
        |The first player is: #{@player_one} with #{@sign_x}
        |**** V.S ****
        |the second player is: #{@player_two} with #{@sign_o}
        "
  end

  def print_board(board)
    puts "
      #{board[0]} | #{board[1]} | #{board[2]}
      ----------
      #{board[3]} | #{board[4]} | #{board[5]}
      ----------
      #{board[6]} | #{board[7]} | #{board[8]}"
  end

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
        print_board(game_board)
      end
    else
          puts 'Invalid number'
          puts 'Please select number between 1 and 9'
          number = gets.chomp.to_i
          check(number, player, game_board, arr)
      end
  end
end

flag = false
game_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
arr = []
new_game = StartGame.new(player_one, player_two)
new_game.greeting
new_game.print_board(game_board)

count = 0
while flag == false

  puts "#{player_one} turn: Select number between 1 To 9"
  player_one_turn = gets.chomp.to_i
  new_game.check(player_one_turn, 1, game_board, arr)
  # method: check the number if it is valid number and not repeated.
  # Change the board if check pass : Now, the move is displayed on the board.
  # Or: Write warning message if invalid number or repeated number.

  puts "#{player_two} turn: Select number between 1 To 9"
  player_two_turn = gets.chomp.to_i
  new_game.check(player_two_turn, 2, game_board, arr)
  # method: check the number if it is valid number and not repeated.
  # Change the board if check pass : Now, the move is displayed on the board.
  # Or: Write warning message if invalid number or repeated number.

  flag = true if count > 2
  # Loop the process until the game is end.
  count += 1
end

def result(move , player='No one won')
  if move == 'win'
    puts "Congratulation #{player} ! You win !!"
  elsif move == 'draw'
    puts "That is DRAW !"
  end
end

puts result('win' , player_one) , result('draw') 