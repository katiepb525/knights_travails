require_relative 'board'
require 'pry-byebug'
# frozen_string_literal: true

class Knight
  def initialize
    # @possible_moves = get_possible_moves
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

    # for every key in possible directions
    possible_directions.each do |k, v|
    
      # # get sum of x values
      result = []
      result.push((place[:x] + possible_directions[k][0]) - 1)
      result.push((place[:x] + possible_directions[k][1]) - 1)

      # catch instances of x or y values being above eight
      if result[0] > 8 or result[1] > 8
        next
      else
        # mark edge using result's axis values
        matrix[(result[1])][(result[0])] = 1
      end
      
    end  
    matrix
  end
end




board = Board.new

board.grid

knight = Knight.new

place = { :x => 0, :y => 0}

possible_moves = knight.get_possible_moves(place, board)

possible_moves.each_with_index do |e|
  p e
end

p possible_moves[2][1]