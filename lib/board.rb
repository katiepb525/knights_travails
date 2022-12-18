# frozen_string_literal: true

require 'pry-byebug'

class Place
  def initialize(x, y)
    @x = x
    @y = y
  end
end

class Board
  attr_reader :grid

  def initialize
    @grid = createGrid(8, 8)
  end

  # create an 8x8 grid with all possible cordinates (undirected edge list)
  def createGrid(width, height)
    (0..width).to_a.product((0..height).to_a).map do |x, y|
      Place.new(x, y)
    end
  end
end

board = Board.new

