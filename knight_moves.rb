# frozen_string_literal: true

require 'pry-byebug'

class Place
  attr_accessor :x, :y, :predecessor, :distance
  
  def initialize(x, y, predecessor=nil, distance=nil )
    @x = x
    @y = y
    @predecessor = predecessor
    @distance = distance
  end
end

class Knight

  # create a linked list from single place to later place into adjacency list

  def legal_moves(place)
    # list of possible moves
    possible_directions = [[2,1],[1,2],[-1,2],[-2,1],[-2,-1],[-1,-2],[1,-2],[2,-1]]
    # initalize array
    list = []

    # for every key in possible directions
    possible_directions.each do |k|

      # get sum of x + y values
      result = []
      result.push((place.x + k[0]))
      result.push((place.y + k[1]))

      # catch instances of x or y values being above (or equal to) eight (cause we cant go past 7,7)
      # catch instances of x or y values being less than zero (cause there are no values below 0,0)
      next if result[0] >= 8 || result[1] >= 8 || result[0].negative? || result[1].negative?

      p result

      # create new place node and push into list
      new_place = Place.new(result[0], result[1])
      list.push(new_place)

    end

    return list

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
start = Place.new(3,3)
place_end = Place.new(4,3)

p knight.legal_moves(start)
