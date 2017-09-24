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
    distance_row = this.row.to_i - coords[0].to_i
    # if first can move 2 forward
    if @first
      @first = false
      if distance_row.abs == 2 || 1
        return true
      else
        return false
      end
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
# Checks if pawns move coords are in proper column or occupied
####
  def legal_column(this, coords)
    distance_col = (this.column.to_i - coords[1].to_i).abs
    if this.column.to_i == coords[1].to_i
      return true
    elsif distance_col == 1
      occupied = this.occupied?(coords)
      #puts occupied
      return occupied
    else
      puts "columns != && not occupied"
      return false
    end
  end

end