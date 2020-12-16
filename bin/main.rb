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

class 

new_game = StartGame.new(player_one , player_two)
new_game.greeting
new_game.print_board([1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9])
