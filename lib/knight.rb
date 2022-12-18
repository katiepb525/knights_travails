require_relative 'board'

# frozen_string_literal: true

class Knight
  def initialize
    @possible_moves = get_possible_moves
  end

# create a list of possible moves **from a given square**

  def get_possible_moves # given starting square as parameter
    # list of possible directions: up two left one, up two right one, down two left one, down two right one
    possible_directions = { u2_l1 => [1, 2], u2_r1 => [-1, 2], d2_l1 => [1, -2], d2_r1 => [-1, -2] }

    # create adjacency matrix to store all possible moves **from given square**

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