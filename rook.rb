class Rook < Piece
  attr_accessor :row, :column, :color, :type
  def initialize(row, column, color, type="R ")
    super
  end

#################################
#
####
  def legal(this, coords)
    row = this.row.to_i
    column = this.column.to_i
    @coords_x = coords[0].to_i
    @coords_y = coords[1].to_i
    if row === @coords_x || column === @coords_y
      occupied = this.occupied?(coords)
      return occupied
    else
      return false
    end
  end

end