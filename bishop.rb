class Bishop < Piece
  attr_accessor :row, :column, :color, :type
  def initialize(row, column, color, type="B ")
    super
  end

  def self.legal
    return true
  end
end