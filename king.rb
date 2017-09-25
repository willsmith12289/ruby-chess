class King < Piece
  attr_accessor :row, :column, :color, :type
  def initialize(row, column, color, type="K ")
    super
  end
 
#################################
# Checks legality of king move coords
# loops through possible moves to see if contains move coords 
#### 
  def legal(this, coords)
    row_dist = (this.row.to_i - coords[0].to_i).abs
    col_dist = (this.column.to_i - coords[1].to_i).abs
    if row_dist > 1 || col_dist > 1
      return false
    else
      occupied = this.occupied?(coords)
      return occupied
    end
  end

#################################
#
#### 
end