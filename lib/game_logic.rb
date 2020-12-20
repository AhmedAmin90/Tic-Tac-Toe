# rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Layout/LineLength

class StartGame
  attr_reader :player_one, :player_two

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
  end

  def greeting
    Rainbow("
          |Welcome to Tic Tac Toe game, ").yellow + Rainbow("
          |The first player is: #{@player_one} with ").yellow + Rainbow('X').blue + Rainbow("
          |**** V.S ****").yellow + Rainbow("
          |the second player is: #{@player_two} with ").yellow + Rainbow('O').purple
  end

  def print_board(board)
    Rainbow("
        #{board[0]} | #{board[1]} | #{board[2]}
        ----------
        #{board[3]} | #{board[4]} | #{board[5]}
        ----------
        #{board[6]} | #{board[7]} | #{board[8]}").aqua
  end
end

class WinOrDraw
  attr_reader :flag, :draw

  def initialize
    @flag = false
    @draw = false
  end

  def game_status(board, flag, draw: false)
    @flag = flag
    @draw = draw
    if ((board[0] == board[1]) && (board[1] == board[2])) || ((board[3] == board[4]) && (board[4] == board[5])) || ((board[6] == board[7]) && (board[7] == board[8]))

      @flag = true

    elsif ((board[0] == board[3]) && (board[3] == board[6])) || ((board[1] == board[4]) && (board[4] == board[7])) || ((board[2] == board[5]) && (board[5] == board[8]))

      @flag = true

    elsif ((board[0] == board[4]) && (board[4] == board[8])) || ((board[2] == board[4]) && (board[4] == board[6]))

      @flag = true

    elsif board.count(Rainbow('X').blue) > 4
      @draw = true
      @flag = true
    end
  end
end
# rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Layout/LineLength
