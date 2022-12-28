# frozen_string_literal: true

require 'pry-byebug'

class Place
  def initialize(x, y, board_size)
    @x = x
    @y = y
    # store possible legal moves for current node
    @legal_moves = get_legal_moves(@x, @y, board_size)
  end

  # given starting square as parameter
  def get_legal_moves(x, y, board_size)
    # list of possible directions (added to x and y)
    possible_directions = { l1_u2: [-1, 2], r1_u2: [1, 2], l1_d2: [-1, -2], r1_d2: [1, -2],
                            l2_u1: [-2, 1], l2_d1: [-2, -1], r2_u1: [2, 1], r2_d1: [2, -1] }

    # create adjacency matrix to store all possible moves **from given square**
    # use dimensions of board to determine size of matrix
    # 0 is default
    matrix = Array.new(board_size) { Array.new(board_size, 0) }

    # for every key in possible directions
    possible_directions.each do |k, _v|
      # # get sum of x + y values
      result = []
      result.push((x + possible_directions[k][0]) )
      result.push((y + possible_directions[k][1]) )

      # catch instances of x or y values being above (or equal to) eight
      # catch instances of x or y values being less than zero
      next if result[0] >= 8 || result[1] >= 8 || result[0].negative? || result[1].negative?

      # mark edge using result's axis values
      matrix[(result[0])][(result[1])] = 1
    end
    matrix
  end
end

class Board
  attr_reader :grid, :height, :width

  def initialize
    @size = 8
    @grid = createGrid(@size)
  end

  # create an 8x8 grid with all possible cordinates (undirected edge list)
  def createGrid(size)
    (0..size).to_a.product((0..size).to_a).map do |x, y|
      Place.new(x, y, size)
    end
  end
end

board = Board.new

p board.grid