class Queen < Piece
  attr_accessor :row, :column, :color, :type
  def initialize(row, column, color, type="Q ")
    super
  end

#################################
# Checks legality of Queens moves
####
  def legal(this, coords)
    row = this.row.to_i
    column = this.column.to_i
    dest_row = coords[0].to_i
    dest_col = coords[1].to_i
    row_dist = (row - dest_row).abs
    col_dist = (column - dest_col).abs
    puts row_dist
    puts col_dist
    if row_dist > 1 || col_dist > 1
      return false
    else
      occupied = this.occupied?(coords)
      return occupied
    end
  end

end