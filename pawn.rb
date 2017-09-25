class Pawn < Piece
  attr_accessor :row, :column, :color, :type, :first
  def initialize(row, column, color, type="P ")
    super
    @first = true
  end

#################################
# Determines in Pawns move is legal
####
  def legal(this, coords)
    # How far piece moved from start position to end position
    distance_row = this.row.to_i - coords[0].to_i
    # if @first =  true call first_move method
    if @first
      # steps for pawns first move
      first_move(coords, distance_row)
    else
      if this.color == "black" && distance_row == 1
        legal_column(this, coords)
      elsif this.color == "white" && distance_row == -1
        legal_column(this, coords)
      else
        puts "greater than1.abs"
        return false
      end
    end
  end

#################################
# Steps for pawns first move
####
  def first_move(coords, distance)
    # sets @first to false so it can never move twice again
    @first = false
    if distance.abs == 2 || 1
      return true
    else
      return false
    end
  end

#################################
# Checks if pawns move coords are in proper column or occupied
####
  def legal_column(this, coords)
    # # of columns moved from start position to end position
    distance_col = (this.column.to_i - coords[1].to_i).abs
    if this.column.to_i == coords[1].to_i #same column
      return true
    elsif distance_col == 1
      #checks if its occupied
      occupied = this.occupied?(coords)
      return occupied
    else
      puts "columns != && not occupied"
      return false
    end
  end

end