class Piece
  include ObjectSpace
  attr_accessor :row, :column, :color, :type

  def initialize(row, column, color, type)
    @row = row.to_i
    @column = column.to_i
    @color = color
    @type = type #calls class new on type of piece
  end

#################################
# Allows calling of Piece.all outside of Piece class
####
  def self.all
    ObjectSpace.each_object(self).to_a
  end

#################################
# Changes row and column of piece instance if move is legal
####
  def move(coords, whos_turn)
    if piece_legal_controller(coords)
      # check to make sure the correct player is going
      if self.color == whos_turn
        #set row and column to move destination coords
        @row = coords[0]
        @column = coords[1]
      else
        puts "not you turn"
        return false
      end
    else
      return false
    end
  end

#################################
# Loops through all pieces to determine if desired coords are occupied
####
  def occupied?(coords)
    @pieces = Piece.all
    # loop through all pieces to find any in move coords
    @pieces.each do |piece|
      if piece.row == coords[0] && piece.column == coords[1]
        # return result of color_check -> attack -> t/f
        occupied = color_check(piece)
        return occupied
      end
    end
    # puts "not occupied"
    # return false
  end

#################################
# Removes opposing piece by setting all attributes = nil
# Returns true to color_check -> occupied -> move
####
def kill(dead_piece)
  dead_piece.row = nil
  dead_piece.column = nil
  dead_piece.color = nil
  dead_piece.type = nil
  return true
end

#################################
# Checks color of occupying piece against own
# Calls attack if color is different
# returns t/f to occupied -> move
####
def color_check(piece)
  if piece.color === self.color
    puts "cant attack same color"
    return false
  elsif piece.color != self.color
    puts "attack!"
    return kill(piece)
  end
end


#################################
# Check for obstruction in path of piece
# determine if vertical, horizontal, or diagonal move
# 
####
  def obstruction?(start, destination)
    # returns -1, 1, 0 depending on value of left relative to right
    direction_x = destination[0] <=> start[0]
    direction_y = destination[1] <=> start[1]
    row_dist = (start[0] - destination[0]).abs
    col_dist = (start[1] - destination[1]).abs
    # finds greater distance either row or column and loops through
    steps = [row_dist, col_dist].max
    (1...steps).each do |step|
      #increments x and y by the comparison <=>
      x = start[0] + step * direction_x
      y = start[1] + step * direction_y
      #loops pieces to see if exist in incremented row col above
      @pieces = Piece.all
      @pieces.each do |piece|
        if piece.row == x && piece.column == y
          # returns the [row, column] for piece in the way
          return [piece.row, piece.column]
        end
      end
    end
    return false
  end

#################################
# Called from piece instances legal method
# calls obstruction? to determine if one exists and where it is
# handles cases
####
  def attack_or_move(coords)
    start = [@row, @column]
    # gets location of obstruction
    piece_location = obstruction?(start, coords)
    # if location of obstruction is desired space, attack
    if piece_location == coords
      puts "location = coords"
      return occupied?(coords)
    # if location of obstruction returned false, move piece
    elsif !piece_location
      puts "false"
      return occupied?(coords)
    else
      puts "piece in the way"
      return false
    end
    
  end
  private

#################################
# Check legality according to piece type
####
  def piece_legal_controller(coords)
      case self.type
        when "P "
          self.legal(coords)
        when "R "
          self.legal(coords)
        when "H "
          self.legal(coords)
        when "R "
          self.legal(coords)
        when "B "
          self.legal(coords)
        when "Q "
          self.legal(coords)
        when "K "
          self.legal(coords)
      end
  end

end