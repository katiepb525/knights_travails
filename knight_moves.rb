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

      # create new place node and push into list
      new_place = Place.new(result[0], result[1])
      list.push(new_place)

    end
    return list

  end

  # perform a breadth first search from a given start to a given end coordinate
  def bfs(start_coord, end_coord)

    # initalize start's distance with 0
    start_coord.distance = 0;

    # create a queue to store the node to be looked at, intialized with start
    queue = [start_coord]

    until queue.empty?
      # get node from beginning of queue and store current coord
      current = queue.shift

      # if the current node is the end node, stop
      if current.x == end_coord.x && current.y == end_coord.y
        # store predecessors
        predecessors = []

        # initialize predecessors with current
        predecessors.push([current.x, current.y]);

        # store current parent being looked at
        curr_parent = current.predecessor

        until (curr_parent == start_coord) do
          # update current parent
          predecessors.push([curr_parent.x, curr_parent.y])
          # loop to next
          curr_parent = curr_parent.predecessor
        end

        predecessors.push([curr_parent.x, curr_parent.y])
        return predecessors
      end

      # look at all legal moves for current node
      enq_list = legal_moves(current)

      # for each legal move
      enq_list.each do |move|
        if (move.distance.nil?)
          # p "checking [#{move.x}, #{move.y}]"
          move.distance = current.distance + 1
          move.predecessor = current
          queue.push(move)
          # p "predecessor: [#{move.predecessor.x}, #{move.predecessor.y}]"
          # p "distance: #{move.distance}"
        end
      end
    end 
  end


  end
end

knight = Knight.new
start = Place.new(3,3)
place_end = Place.new(4,3)

p knight.knight_moves(start, place_end)
