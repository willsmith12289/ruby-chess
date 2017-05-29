class Piece
  include ObjectSpace
  attr_accessor :row, :column, :color, :type
  def initialize(row, column, color, type)
    @row = row.to_i
    @column = column.to_i
    @color = color
    @type = type #calls class new on type of piece
  end
  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def move(coords)
    if piece_legal_controller(coords)
      @row = coords[0]
      @column = coords[1]
    else
      puts "Illegal Move!"
    end
  end
  
  def piece_legal_controller(coords)
    case self.type
      when "P "
        Pawn.legal(coords)
      when "R "
        Rook.legal
      when "H "
        Knight.legal
      when "R "
        Rook.legal
      when "B "
        Bishop.legal
      when "Q "
        Queen.legal
      when "K "
        King.legal 
    end
  end
end