class Rook < Piece
  attr_accessor :row, :column, :color, :type
  def initialize(row, column, color, type="R ")
    super
  end
  
  def legal(piece_instance, coords)
    return true
  end
end