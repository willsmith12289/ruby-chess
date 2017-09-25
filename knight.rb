class Knight < Piece
  attr_accessor :row, :column, :color, :type
  def initialize(row, column, color, type="H ")
    super
  end

#################################
# Legal knight moves
####
  def legal(this, coords)
    row = this.row.to_i
    column = this.column.to_i
    @moves = Array.new()
    @moves << [row-2, column+1]
    @moves << [row-2, column-1]
    @moves << [row+2, column+1]
    @moves << [row+2, column-1]
    @moves << [row+2, column-1]
    @moves << [row+2, column+1]
    @moves << [row-2, column-1]
    @moves << [row-2, column+1]
    @coords_x = coords[0].to_i
    @coords_y = coords[1].to_i
    #loop through possible moves
    @moves.each do |move|
      #if chosen coords = coords in moves array return true
      if @coords_x === move[0].to_i && @coords_y === move[1].to_i
        occupied = this.occupied?(coords)
        return occupied
      else
        next
      end
    end
    return false  
  end

end