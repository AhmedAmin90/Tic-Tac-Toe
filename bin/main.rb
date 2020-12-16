#!/usr/bin/env ruby
puts "Name of First Player : "
player_one = gets.chomp

puts "Name of Seconde Player : "
player_two = gets.chomp

class StartGame

    def initialize (player_one, player_two)
        @player_one = player_one
        @player_two = player_two
        @sign_X = "X"
        @sign_O = "O"
    end

    def greeting
        puts "
        |Welcome to Tic Tac Toe game,
        |The first player is: #{@player_one} with #{@sign_X}
        |**** V.S ****
        |the second player is: #{@player_two} with #{@sign_O}
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
end

 

new_game = StartGame.new(player_one , player_two)
new_game.greeting
new_game.print_board([1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9])

puts "#{player_one} turn: Select number between 1 To 9"
player_one_turn = gets.chomp.to_i
# method: check the number
# Change the board if check pass “Now, the move is displayed on the board”
# Or: Write warning message if invalid number or repeated number

puts "#{player_two} turn: Select number between 1 To 9"
player_two_turn = gets.chomp.to_i
# method: check the number
# Change the board if check pass “Now, the move is displayed on the board”
# Or: Write warning message if invalid number or repeated number

