# rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Layout/LineLength

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

end

class WinOrDraw
  attr_accessor :flag , :draw

  def initialize
    @flag = false
    @draw = false
  end

  def game_status(board, flag , draw=false)
    @flag = flag
    @draw = draw
    if ((board[0] == board[1]) && (board[1] == board[2])) || ((board[3] == board[4]) && (board[4] == board[5])) || ((board[6] == board[7]) && (board[7] == board[8]))
       
      @flag = true

    elsif ((board[0] == board[3]) && (board[3] == board[6])) || ((board[1] == board[4]) && (board[4] == board[7])) || ((board[2] == board[5]) && (board[5] == board[8]))
       
      @flag = true

    elsif ((board[0] == board[4]) && (board[4] == board[8])) || ((board[2] == board[4]) && (board[4] == board[6]))
      
      @flag = true

    elsif board.count('X') > 4
      @draw = true
      @flag = true
    end
  end
end
# rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Layout/LineLength
