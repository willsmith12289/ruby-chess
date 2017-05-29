class King < Piece
  attr_accessor :row, :column, :color, :type
  def initialize(row, column, color, type="K ")
    super
  end
  
  def self.legal
    return true
  end
end