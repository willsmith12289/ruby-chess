class Rook < Piece
  attr_accessor :row, :column, :color, :type
  def initialize(row, column, color, type="R ")
    super
  end
  
  def self.legal
    return true
  end
end