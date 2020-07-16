module Players 
    class Human < Player 
        
        def move(input)
            puts "Please enter a number between 1 and 9:"
            gets.strip
        end
    end
end