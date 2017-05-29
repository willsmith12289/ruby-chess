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
      @row = coords[0].to_i
      @column = coords[1].to_i
    else
      puts "Illegal Move!"
    end
  end

  private

  def piece_legal_controller(coords)
    @piece = self
    
    case @piece.type
      when "P "
        # puts @piece
        @piece.legal(@piece, coords)
      when "R "
        @piece.legal(@piece, coords)
      when "H "
        @piece.legal(@piece, coords)
      when "R "
        @piece.legal(@piece, coords)
      when "B "
        @piece.legal(@piece, coords)
      when "Q "
        @piece.legal(@piece, coords)
      when "K "
        @piece.legal(@piece, coords)
    end
  end
end