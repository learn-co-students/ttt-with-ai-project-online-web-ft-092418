require_relative '../player.rb'

module Players
    class Human < Player
        def move(b)
            gets
        end
    end
end