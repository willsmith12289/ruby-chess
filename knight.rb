class Knight < Piece
  attr_accessor :row, :column, :color, :type
  def initialize(row, column, color, type="H ")
    super
  end

#################################
# Legal knight moves
# Moves in l formation 2 by 1 squares
####
  def legal(coords)
    offsets = [ [1, 2], [-1, 2], [1, -2], [-1, -2], [2, 1], [-2, 1], [2, -1], [-2, -1] ]
    moves = []
    offsets.each do |offset|
      move = [@row+offset[0], @column+offset[1]]
      moves << move
    end
    #loop through possible moves
    moves.each do |move|
      #if chosen coords = coords in moves array return true
      if coords[0].to_i === move[0].to_i && coords[1].to_i === move[1].to_i
        return occupied?(coords)
      else
        next
      end
    end
    return false  
  end

end