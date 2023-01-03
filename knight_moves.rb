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

  
  # find distance between two coordinates
  def find_distance(possible_moves, end_coord)
    # d = sqrt(( x2 - x1 )^2 + (y2 -  y1)^2)
    dist = Math.sqrt((end_coord[0] - possible_moves[0]) ** 2 + (end_coord[1] - possible_moves[1]) ** 2)
    # round to tenths
    dist.round(1)
  end

  # find shortest possible path from a given start to a given end set of coords
  def knight_moves(start_coord, end_coord)

    # create a queue to store the coord to be looked at, intialized with start
    queue = [start_coord]

    # store visited moves
    visited_moves = []

    # while the coord being looked at is NOT the end coord
    while !queue.empty?

      # shift the queue and store current coord
      current = queue.shift

      break if current == end_coord


      # store current as visited
      visited_moves.push(current)

      # get legal moves for current coord
      available_moves = get_legal_moves(current[0], current[1])

      # initalize/reset array storing distances
      distances = []

      # for every legal move
      available_moves.each do |move|
        # skip if move has already been visited
        # next if visited_moves.include?(move)
        # get distance of each to end coord
        curr_dist = find_distance(move, end_coord)
        # push into new array with distances
        distances.push(curr_dist)
      end

      # find the two lowest distances from array + their index
      # will return nested array
      lowest_two = distances.each_with_index.min(2)


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

p knight.find_distance([0,0],[3,4])
