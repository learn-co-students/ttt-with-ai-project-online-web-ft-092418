class Board
    attr_accessor :cells 

    def initialize 
        reset!
    end

    def reset!
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display 
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "-----------"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts "-----------"
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    def position(input)
        @cells[input.to_i-1]
    end

    def update(position, player)
        @cells[position.to_i-1] = player.token
    end

    # def token
    # end

    def full?
        cells.all?{ |token| token == "X" || token == "O" }
    end

    def turn_count
        cells.count{ |token| token == "X" || token == "O" }
    end

    def taken?(input)
        position(input) == " " ? false : true
    end
    
    def valid_move?(position)
        position.to_i.between?(1,9) && !taken?(position) 
    end
end