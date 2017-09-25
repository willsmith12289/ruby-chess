#################################
# Can move any number of squares diagonally
# Cannot leap over other pieces.
####
class Bishop < Piece
  attr_accessor :row, :column, :color, :type
  def initialize(row, column, color, type="B ")
    super
  end

#################################
# defines Offsets
####
  def offsets
    diagonal
  end

#################################
# Creates possible moves array
# adds all possible moves to it
#### 
  def moves
    possible_moves = []
    offsets.each do |offset|
      prev_position = [@row, @column]
      while true
        new_pos = [(prev_position[0] + offset[0]), (prev_position[1] + offset[1])]
        break unless position_in_bounds?(new_pos)
        occupied = this.occupied?(new_pos)
        possible_moves << new_pos if !occupied
        break if occupied
        prev_position = new_pos
      end
    end
    possible_moves
  end

#################################
#
####
  def legal(this, coords)
    @coords_x = coords[0].to_i
    @coords_y = coords[1].to_i

    possible_moves(this)
    puts "possible_moves"
    if this.row.to_i == @coords_x || this.column.to_i == @coords_y
      return false
    else
      occupied = this.occupied?(coords)
      return occupied
    end
  end

#################################
# loop through possible moves, add to array
####
  # def possible_moves(piece_instance)
  #   row = piece_instance.row.to_i
  #   column = piece_instance.column.to_i
  #   @moves = Array.new()
  #     until row >= 7 || column >= 7
  #         row += 1
  #         column += 1
  #         move = [row, column]
  #         # puts "row"
  #         # puts row
  #         # puts "column"        
  #         # puts column
  #         if !occupied?(move)
  #         @moves << move
  #         else
  #           break
  #         end
  #     end
  # end

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