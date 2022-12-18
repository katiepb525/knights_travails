require_relative 'board'

# frozen_string_literal: true

class Knight
  def initialize
    @possible_moves = get_possible_moves
  end

# create a list of possible moves using a graph

  def get_possible_moves
    # list of possible directions: up two left one, up two right one, down two left one, down two right one
    possible_directions = { u2_l1 => [1, 2], u2_r1 => [-1, 2], d2_l1 => [1, -2], d2_r1 => [-1, -2] }

    # a list of possible moves going down


  end
end

board = Board.new

p board.grid