class Rook < Piece
  attr_accessor :row, :column, :color, :type
  def initialize(row, column, color, type="R ")
    super
  end

#################################
#
####

#################################
# Checks legality of rooks moves
# Moves horizontally/vertically as many spaces as wants
# cant jump pieces
####
  def legal(coords)
    coords_x = coords[0]
    coords_y = coords[1]
    # legal if piece remains in same row or column 
    if @row == coords_x || @column == coords_y
     attack_or_move(coords)
    else
      return false
    end
  end

end