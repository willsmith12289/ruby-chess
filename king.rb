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
    row_dist = (@row.to_i - coords[0].to_i).abs
    col_dist = (@column.to_i - coords[1].to_i).abs
    if row_dist > 1 || col_dist > 1
      return false
    else
      occupied = self.occupied?(coords)
      return occupied
    end
  end

#################################
#
#### 
end