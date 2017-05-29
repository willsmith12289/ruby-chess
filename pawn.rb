class Pawn < Piece
  attr_accessor :row, :column, :color, :type
  def initialize(row, column, color, type="P ")
    super
  end
  
  def self.legal
    return true
  end
end