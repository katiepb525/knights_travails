# frozen_string_literal: true

require 'pry-byebug'

class Place
  attr_accessor :x, :y, :predecessor, :legal_moves, :distance
  
  def initialize(x, y, predecessor=nil, distance=nil, legal_moves=nil)
    @x = x
    @y = y
    @predecessor = predecessor
    @distance = distance
    @legal_moves = legal_moves
  end
end
# in order to perform a breadth first search, you have to have a board to search from

class Knight
  def get_legal_moves(x, y)
    # list of possible directions (added to x and y)

    possible_directions = { l2_u1: [-2, 1], l1_u2: [-1, 2], r2_u1: [2, 1], r1_u2: [1, 2], l2_d1: [-2, -1], l1_d2: [-1, -2],
                            r2_d1: [2, -1], r1_d2: [1, -2] }

    # for every key in possible directions
    possible_directions.each do |k, _v|

      # get sum of x + y values
      result = []
      result.push((x + possible_directions[k][0]))
      result.push((y + possible_directions[k][1]))

      # catch instances of x or y values being above (or equal to) eight
      # catch instances of x or y values being less than zero
      next if result[0] >= 8 || result[1] >= 8 || result[0].negative? || result[1].negative?

      # create node for legal move
      legal_move = Place.new(result)

      p legal_move
    end

  end


  # perform a breadth first search from a given start to a given end coordinate
  def knight_moves(start_coord, end_coord)

    # convert start coord into a node
    start_coord = Place.new(start_coord, nil, get_legal_moves(start_coord[0], start_coord[1]))

    # create a queue to store the node to be looked at, intialized with start
    queue = [start_coord]

    # make a list of the visited nodes
    visited_nodes = []

    until queue.empty?
      # get node from beginning of queue and store current coord
      current = queue.shift

      # if the current node is the end node, stop
      break if current.position == end_coord

      # look at all legal moves for current node
      enq_list = current.legal_moves

      # for each legal move
      enq_list.each do |move|
        # create a new node and set it's origin to current node being looked at
        new_node = Place.new(move, current)

        # if node hasn't been visited
        if !(visited_nodes.include?(new_node))
          # push into end of queue
          queue.push(new_node)
          # mark as visited
          visited_nodes.push(new_node)
        end
        p new_node
      end
    end

  end
end

knight = Knight.new

p knight.get_legal_moves(0,0)


p knight.knight_moves([0, 0], [3, 3])
# p knight.knight_moves([3, 3], [0, 0])

