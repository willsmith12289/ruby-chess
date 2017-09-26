class Bishop < Piece
  attr_accessor :row, :column, :color, :type
  def initialize(row, column, color, type="B ")
    super
  end

#################################
# Can move diagonally as many spaces as wants
# cant jump pieces
####
  def legal(this, coords)
    @coords_x = coords[0].to_i
    @coords_y = coords[1].to_i
    start = [this.row.to_i, this.column.to_i]
    # possible_moves(this)
    # puts "possible_moves"
    if this.row.to_i == @coords_x || this.column.to_i == @coords_y
      return false
    else
      piece_location = obstruction?(start, coords)
      if piece_location == coords
        puts "location = coords"
        occupied = this.occupied?(coords)
        return occupied
      # if location of obstruction returned false, move piece
      elsif !piece_location
        puts "false"
        occupied = this.occupied?(coords)
        return occupied
      else
        puts "piece in the way"
        return false
      end
    end
  end

#################################
# loop through possible moves, add to array
####
  def possible_moves(piece_instance)
    row = piece_instance.row.to_i
    column = piece_instance.column.to_i
    @moves = Array.new()
      until row >= 7 || column >= 7
          row += 1
          column += 1
          move = [row, column]
          # puts "row"
          # puts row
          # puts "column"        
          # puts column
          @moves << move
      end
  end

#################################
#
####
  # def no_piece(move)
  #   @pieces = Piece.all
  #   @pieces.each do |piece|
  #     #if any piece is in same spot as move return false
  #     if piece.row.to_i === move[0] && piece.column.to_i === move[1]
  #       return false
  #     else
  #       return true
  #     end
  #   end
  # end


end