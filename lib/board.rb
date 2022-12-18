require 'matrix'

class Board
    attr_reader :matrix
    def initalize
        @matrix = Matrix.build(8,8)
    end
end

class Knight

end

board = Board.new
puts Matrix.build(8,8)