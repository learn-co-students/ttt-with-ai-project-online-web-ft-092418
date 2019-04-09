module Players
    class Computer < Player
        attr_reader :token, :enemy_token
        attr_accessor :winning_combos, :trap_combos
    
        
        def initialize(token)
            @token = token
            self.token == "X" ? @enemy_token = "O" : @enemy_token = "X"
            self.winning_combos = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
    
            self.trap_combos = [["O", "X", " ", " ", "X", " ", " ", "O", " "]]
        end
        
        def move(board)
            
            self.winning_combos.delete_if { |combo|
                !combo.map{|pos| board.cells[pos]}.include?(" ")
            }
    
            my_move = nil
            my_move = self.check_wins_and_move(self.token, my_move, board)
            
            if my_move == nil 
                my_move = self.check_wins_and_move(enemy_token, my_move, board)
            end        
    
            if my_move == nil 
                return "5" if board.valid_move?(5)
                if self.trap_combos.include?(board.cells)
                    return "7"
                end
                for i in 0..8
                    return i.to_s if board.valid_move?(i)
                end
            end
    
            my_move.to_s
        end
    
        def check_wins_and_move(temp_token, my_move, board)
            winning_combos.each do |combo|
                arr = combo.map{|pos| board.cells[pos]}
                if arr.count(temp_token) == 2 
                    my_move = combo.find {|i| board.valid_move?(i+1)}
                end            
            end
            (my_move + 1).to_s if my_move
        end
    end
end