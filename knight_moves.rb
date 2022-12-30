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


  def knight_moves(start_coord, end_coord)


  end
end

knight = Knight.new

p knight.get_legal_moves(4,3)