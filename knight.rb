class Knight < Piece
  attr_accessor :row, :column, :color, :type
  def initialize(row, column, color, type="H ")
    super
  end
  
  def self.legal
    return true
  end
end