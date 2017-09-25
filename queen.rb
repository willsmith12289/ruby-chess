#################################
# Can move any number of squares along a row, column, or diagonal
# Cannot leap over other pieces.
####
class Queen < Piece
  attr_accessor :row, :column, :color, :type
  def initialize(row, column, color, type="Q ")
    super
  end

#################################
# defines Offsets
####
  # def offsets
  #   diagonal + horizontal_vertical
  # end

#################################
# Checks legality of Queens moves
# Any spaces any direction
####
  def legal(this, coords)
    row = piece_instance.row.to_i
    column = piece_instance.column.to_i
    @moves = []
    until row >= 7 || column >= 7
      row += 1
      column += 1
      move = [row, column]
      @moves << move
    end
      occupied = this.occupied?(coords)
      return occupied
  end

end