class Rook < Piece
  attr_accessor :row, :column, :color, :type
  def initialize(row, column, color, type="R ")
    super
  end
  
  def legal(piece_instance, coords)
    @coords_x = coords[0].to_i
    @coords_y = coords[1].to_i
    if piece_instance.row.to_i === @coords_x || piece_instance.column.to_i === @coords_y
      return true
    else
      return false
    end
  end
end