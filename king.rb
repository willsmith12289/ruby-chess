class King < Piece
  attr_accessor :row, :column, :color, :type
  def initialize(row, column, color, type="K ")
    super
  end
 
#################################
# Checks legality of king move coords
# any direction 1 space
#### 
  def legal(coords)
    row_dist = (@row - coords[0]).abs
    col_dist = (@column - coords[1]).abs
    if row_dist > 1 || col_dist > 1
      return false
    else
      return occupied?(coords)
    end
  end

#################################
#
#### 
end