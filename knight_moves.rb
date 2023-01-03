# frozen_string_literal: true

require 'pry-byebug'

class Knight
  def get_legal_moves(x, y)
    # list of possible directions (added to x and y)
    possible_directions = { l1_u2: [-1, 2], r1_u2: [1, 2], l1_d2: [-1, -2], r1_d2: [1, -2],
                            l2_u1: [-2, 1], l2_d1: [-2, -1], r2_u1: [2, 1], r2_d1: [2, -1] }

    # store possible legal moves in nested array [[1,2],[2,-3]...]
    legal_moves = []
    
    # for every key in possible directions
    possible_directions.each do |k, _v|
      # # get sum of x + y values
      result = []
      result.push((x + possible_directions[k][0]))
      result.push((y + possible_directions[k][1]))

      # catch instances of x or y values being above (or equal to) eight
      # catch instances of x or y values being less than zero
      next if result[0] >= 8 || result[1] >= 8 || result[0].negative? || result[1].negative?

      # add coordinate to list of legal moves
      legal_moves.push([result[0],result[1]])
    end
    legal_moves
  end

  
  # compare distances between possible moves and end coord
  def find_neighbors(possible_moves, end_coord)

  end

  # find shortest possible path from a given start to a given end set of coords
  def knight_moves(start_coord, end_coord)

    # create a queue to store the coord to be looked at, intialized with start
    queue = [start_coord]

    # store visited moves
    visited_moves = []

    # while the coord being looked at is NOT the end coord
    while !(queue[0][0] == end_coord[0] && queue[0][1] == end_coord[1])
      # shift the queue and store current coord
      current = queue.shift

      # store current as visited
      visited_moves.push(current)

      # get legal moves for current coord
      available_moves = get_legal_moves(current[0], current[1])

      # for every legal move
      available_moves.each do |move|
        # remove any moves that are not close to end
        # breadth first search looks and queues NEIGHBORS


        next if visited_moves.include?(move)
        # push into queue
        queue.push(move)
      end

    end
    visited_moves.push(end_coord)
    visited_moves
  end
end


knight = Knight.new

p knight.get_legal_moves(0,0)
