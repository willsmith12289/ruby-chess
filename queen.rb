class Queen < Piece
  attr_accessor :row, :column, :color, :type
  def initialize(row, column, color, type="Q ")
    super
  end

#################################
#
####
  def legal(piece_instance, coords)
    return true
  end
end