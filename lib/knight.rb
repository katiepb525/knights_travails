# frozen_string_literal: true

require_relative 'board'
require 'pry-byebug'

class Knight
  def initialize; end

  # create a list of possible moves **from a given square**

  # find the shortest possible way from coordinate start to coordinate end
  # using breadth first level order
  def knight_moves(k_start, k_end); end
end

board = Board.new

board.grid

knight = Knight.new

place = { x: 4, y: 3 }

possible_moves = knight.get_legal_moves(place, board)

possible_moves.each do |e|
  p e
end

p possible_moves[2][1]

# knight.knight_moves([3,4],[4,3])
