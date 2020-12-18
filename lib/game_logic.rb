# rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Layout/LineLength

class StartGame
  attr_accessor :flag

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @sign_x = 'X'
    @sign_o = 'O'
    @flag = false
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

  def game_status(board, player, flag)
    @flag = flag
    if ((board[0] == board[1]) && (board[1] == board[2])) || ((board[3] == board[4]) && (board[4] == board[5])) || ((board[6] == board[7]) && (board[7] == board[8]))
      puts "Congratulation #{player} ! You Win "
      @flag = true

    elsif ((board[0] == board[3]) && (board[3] == board[6])) || ((board[1] == board[4]) && (board[4] == board[7])) || ((board[2] == board[5]) && (board[5] == board[8]))
      puts "Congratulation #{player} ! You Win "
      @flag = true

    elsif ((board[0] == board[4]) && (board[4] == board[8])) || ((board[2] == board[4]) && (board[4] == board[6]))
      puts "Congratulation #{player} ! You Win "
      @flag = true

    elsif board.count('X') > 4
      puts 'Draw!'
      @flag = true

    else
      puts 'Continue in the game'

    end
  end
end
# rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Layout/LineLength
