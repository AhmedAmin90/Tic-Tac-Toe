#spec/test_spec.rb
require './bin/main'
require './lib/game_logic'
require 'rainbow'

describe StartGame do

    let(:player_one) {'player_one'}
    let(:player_two) {'player_two'}
    let(:new_game) { StartGame.new(player_one,player_two) }
    let(:board) { [1, 2, 3, 4, 5, 6, 7, 8, 9] }
    let(:no) { [] }
 
    describe "#initialize" do
        it "Defines two variables: player_one and Player_two" do
            expect(new_game.player_one).to eq('player_one') 
            expect(new_game.player_two).to eq('player_two') 
        end
    end

    describe "#greeting" do
        it "Returns a welcome message for two players with theirs symbols" do
            expect(new_game.greeting).to eql("\e[33m\n          |Welcome to Tic Tac Toe game, \e[0m\e[33m\n          |The first player is: player_one with \e[0m\e[34mX\e[0m\e[33m\n          |**** V.S ****\e[0m\e[33m\n          |the second player is: player_two with \e[0m\e[38;5;129mO\e[0m")
        end
    end
    
    
    describe "#print_board" do
        it "Return board with 9 boxes" do
            expect(new_game.print_board(board)).to  eql("\e[38;5;51m\n        1 | 2 | 3\n        ----------\n        4 | 5 | 6\n        ----------\n        7 | 8 | 9\e[0m")
        end

        it "Return empty board with 9 boxes" do
            expect(new_game.print_board(no)).to  eql("\e[38;5;51m\n         |  | \n        ----------\n         |  | \n        ----------\n         |  | \e[0m")
        end
    end
end

describe WinOrDraw do
    let(:flag) {false}
    let(:draw) {false}
    let(:status) { WinOrDraw.new }
    let(:board) { [1, 2, 3, 4, 5, 6, 7, 8, 9] }
    let(:board_case_one)  { ['X', 'X', 'X', 4, 5, 6, 7, 8, 9] }
    let(:board_case_two)  { ['X', 2, 3, 'X', 5, 6, 'X', 8, 9] }
    let(:board_case_three) {  ['X', 2, 'X', 'X', 5, 6, 'X', 'X', 9] }

    describe "#initialize" do
        it "description" do
            expect(status.flag).to eql(false)
        end

        it "description" do
            expect(status.draw).to eql(false)
        end  
    end

    describe "#game_status" do
        it "Returns flag is true" do
            expect(status.game_status(board_case_one , flag )).to eql(flag = true) 
        end

        it "Returns flag is true" do
            expect(status.game_status(board_case_two , flag )).to eql(flag = true) 
        end
        
        it "Returns flag is true and draw is true" do
            expect(status.game_status(board_case_three , flag  )).to eql(flag = true) 
            expect(status.game_status(board_case_three , flag  )).to eql(draw = true)
        end 
    end 
end

describe "#check" do
    let(:number_case_one) {1}
    let(:number_case_two) {2}
    let(:number_case_three) {10}
    let(:player_one) { 1 }
    let(:player_two) { 2 }
    let(:arr) {[2]}
    let(:game_board) {[1, 2, 3, 4, 5, 6, 7, 8, 9]}

    it "Returns box in the game board to X" do
        expect(check(number_case_one , player_one , game_board , arr )).to  eql(game_board[number_case_one - 1] = "\e[34mX\e[0m")
    end
    
    it "Returns box in the game board to O" do
        expect(check(number_case_one , player_two , game_board , arr )).to  eql(game_board[number_case_one - 1] = "\e[38;5;129mO\e[0m")
    end
end

describe "#win_draw" do
   
    let(:player) {'player_name'}
    let(:flag) {false}
    let(:draw) {false}
    
    it "Returns the player is win" do
        expect(win_draw(player, true , false)).to eql("\e[1m\e[38;5;226mCongratulation ! #{player} \e[0m\e[1m\e[38;5;226mYou Win\e[0m")
    end

    it "Returns continue in game" do
        expect(win_draw(player, false , false)).to eql("\e[36mContinue in the game !\e[0m")
    end

    it "Return Draw!" do
        expect(win_draw(player, true , true)).to eql("\e[1m\e[32mDRAW !\e[0m")
    end
    
end