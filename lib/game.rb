class Game
    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS =[
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [0, 4, 8],
        [1, 4, 7],
        [2, 5, 8],
        [6, 4, 2]
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end

    def current_player
        @board.turn_count % 2 == 0 ? @player_1 : @player_2
    end

    def won?
        WIN_COMBINATIONS.detect do |combo|
            @board.cells[combo[0]] == @board.cells[combo[1]] &&
            @board.cells[combo[1]] == @board.cells[combo[2]] &&
            @board.taken?(combo[0]+1)
        end
    end

    def draw?
        @board.full? && !won? ? true : false
    end

    def over?
        !@board.full? || draw? && won? ? false : true
    end

    def winner 
        if winning_combo = won?
            @winner = @board.cells[winning_combo.first]
        end
    end

    def turn
        input = current_player.move(board).to_i
        if board.valid_move?(input) 
            board.cells[input-1] = current_player.token
        else 
            puts "please enter a valid move"
            turn
        end
    end

    def play
    until over?
            board.display
            puts " ......... \n"
            turn
        end
        puts won? ? "Congratulations #{winner}!" : "Cat's Game!"
    end     
end