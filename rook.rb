class Rook < Piece
  attr_accessor :row, :column, :color, :type
  def initialize(row, column, color, type="R ")
    super
  end

#################################
#
####

#################################
# Checks legality of rooks moves
# Moves horizontally/vertically as many spaces as wants
# cant jump pieces
####
  def legal(coords)
    # row = this.row.to_i
    # column = this.column.to_i
    start = [@row.to_i, @column.to_i]
    coords_x = coords[0].to_i
    coords_y = coords[1].to_i
    # legal if piece remains in same row or column 
    if @row.to_i == coords_x || @column.to_i == coords_y
      # gets location of obstruction
      piece_location = obstruction?(start, coords)
      # if location of obstruction is desired space, attack
      if piece_location == coords
        puts "location = coords"
        occupied = self.occupied?(coords)
        return occupied
      # if location of obstruction returned false, move piece
      elsif !piece_location
        puts "false"
        occupied = self.occupied?(coords)
        return occupied
      else
        puts "piece in the way"
        return false
      end
      # end
      
    else

      return false
    end
  end

end