require_relative 'board'

# frozen_string_literal: true

class Knight
  def initialize
    @possible_moves = get_possible_moves
  end

# create a list of possible moves **from a given square**

  def get_possible_moves(place, board) # given starting square as parameter
    # list of possible directions (added to x and y)
    possible_directions = { :l1_u2 => [-1, 2], :r1_u2 => [1, 2], :l1_d2 => [-1, -2], :r1_d2 => [1, -2],
      :l2_u1 => [-2, 1], :l2_d1 => [-2, -1], :r2_u1 => [2, 1], :r2_d1 => [2, -1] }

    # create adjacency matrix to store all possible moves **from given square**
    # use dimensions of board to determine size of matrix
    # 0 is default
    matrix = Array.new(board.height) { Array.new(board.width, 0)}

    # starting from given place in matrix (e.g. matrix[0][0])
    # result = place + direction
    # if result.x > 8 or result.y > 8
      # assign value to place in adjacency matrix to 0
    # else
      # assign value to place in adjacency matrix to 1
    
    # if end of current matrix row is reached (e.g. matrix[0][8])
      # move to next matrix row (e.g. matrix[1][0])
    # elsif last row hasn't been reached (e.g. matrix[8][8])
      # start == next place in matrix (e.g. matrix[0][1])
    # else
      # return adajcency matrix

  end
end

board = Board.new

p board.grid