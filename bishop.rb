class Bishop < Piece
  attr_accessor :row, :column, :color, :type
  def initialize(row, column, color, type="B ")
    super
  end

#################################
# Can move diagonally as many spaces as wants
# cant jump pieces
####
  def legal(coords)
    coords_x = coords[0]
    coords_y = coords[1]
    if @row == coords_x || @column == coords_y
      return false
    else
      attack_or_move(coords)
    end
  end

#################################
#
####


end