#################################
# Can move any number of squares along a row or column
# Cannot leap over other pieces
####
class Rook < Piece
  attr_accessor :row, :column, :color, :type
  def initialize(row, column, color, type="R ")
    super
  end

#################################
# defines Offsets
####
  def offsets
    horizontal_vertical
  end

#################################
# defines Offsets
####
  def moves
    possible_moves = []
    offsets.each do |offset|
      prev_position = [@row, @column]
      while true
        new_pos = [(prev_position[0] + offset[0]), (prev_position[1] + offset[1])]
        break unless position_in_bounds?(new_pos)
        occupied = this.occupied?(new_pos)
        possible_moves << new_pos if !occupied
        break if occupied
        prev_position = new_pos
      end
    end
    possible_moves
  end

#################################
# Checks legality of rooks moves
####
  def legal(coords)
    
  end
end