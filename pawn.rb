class Pawn < Piece
  attr_accessor :row, :column, :color, :type, :first
  def initialize(row, column, color, type="P ")
    super
    @first = true
  end

#################################
# Determines in Pawns move is legal
####
  def legal(coords)
    # How far piece moved from start position to end position
    distance_row = @row - coords[0]
    # if @first =  true call first_move method
    if @first
      # steps for pawns first move
      first_move(coords, distance_row)
    else
      if @color == "black" && distance_row == 1
        legal_column(coords)
      elsif @color == "white" && distance_row == -1
        legal_column(coords)
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
    if distance.abs == 2 || distance.abs == 1
      return true
    else
      return false
    end
  end

#################################
# Checks if pawns move coords are in proper column or occupied
####
  def legal_column(coords)
    # # of columns moved from start position to end position
    distance_col = (@column - coords[1]).abs
    if @column == coords[1] #same column
      return true
    elsif distance_col == 1
      #checks if its occupied
      return occupied?(coords)
    else
      puts "columns != && not occupied"
      return false
    end
  end

end