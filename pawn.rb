class Pawn < Piece
  attr_accessor :row, :column, :color, :type, :first
  def initialize(row, column, color, type="P ")
    super
    @first = true
  end

  def self.legal(coords)
    puts moves[first]
    if @first && coords == moves[first]
      return true
    else
      return false
    end
  end
  def moves
    {
    :first => [self.row.to_i+2, self.column.to_i],
    :up => [self.row.to_i+1, self.column.to_i],
    :attack_right => [self.row.to_i+1, self.column.to_i+1],
    :attack_left => [self.row.to_i+1, self.column.to_i-1]
    }
  end
end