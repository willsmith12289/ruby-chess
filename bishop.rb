class Bishop < Piece
  attr_accessor :row, :column, :color, :type
  def initialize(row, column, color, type="B ")
    super
  end

  def legal(piece_instance, coords)
    return true
  end
end