class King < Piece
  attr_accessor :row, :column, :color, :type
  def initialize(row, column, color, type="K ")
    super
  end
 
#################################
# Creates possible moves array
# adds all possible moves to it
#### 
  def moves(this)
    row = this.row.to_i
    column = this.column.to_i
    poss_moves = Array.new()
    poss_moves << [row+1, column]
    poss_moves << [row-1, column]
    poss_moves << [row, column-1]
    poss_moves << [row, column+1]
    poss_moves << [row+1, column+1]
    poss_moves << [row-1, column+1]
    poss_moves << [row-1, column-1]
    poss_moves << [row+1, column-1]
  end

#################################
# Checks legality of king move coords
# loops through possible moves to see if contains move coords 
#### 
  def legal(this, coords)
    @coords_x = coords[0].to_i
    @coords_y = coords[1].to_i
    @moves = moves(this)
    @moves.each do |move|
      if @coords_x === move[0].to_i && @coords_y === move[1].to_i
        occupied = this.occupied?(coords)
        return occupied
      else
        next
      end
    end
    return false
  end

#################################
#
#### 
  # def check
  #   if 
  # end

#################################
#
#### 
  # def check_mate
  #   @moves = moves(self)
  #   @moves.each do |move|
  # end

end