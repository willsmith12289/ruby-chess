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
# defines Offsets
####
  diagonal = [[1, 1], [-1, 1], [1, -1], [-1, -1] ]
  horizontal_vertical = [[1, 0], [-1, 0], [0, 1],  [0, -1]  ]

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
        @row = coords[0].to_i
        @column = coords[1].to_i
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
      if piece.row.to_i == coords[0].to_i && piece.column.to_i == coords[1].to_i
        # return result of color_check -> attack -> t/f
        occupied = color_check(piece)
        return occupied
      else
        return false
      end
    end
    # puts "not occupied"
    # return false
  end

#################################
# Removes opposing piece by setting all attributes = nil
# Returns true to color_check -> occupied -> move
####
def attack(dead_piece)
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
    return attack(piece)
  end
end
#################################
# Make sure given position is on board
####
  def position_in_bounds?(coords)
    coords[0].between?(0,7) && coords[1].between?(0,7)
  end


#################################
# Check for obstruction in path of piece
# determine if vertical, horizontal, or diagonal move
####
  def obstruction(start, destination)
    
  end
  private

#################################
# Check legality according to piece type
####
  def piece_legal_controller(coords)
      case self.type
        when "P "
          self.legal(self, coords)
        when "R "
          self.legal(self, coords)
        when "H "
          self.legal(self, coords)
        when "R "
          self.legal(self, coords)
        when "B "
          self.legal(self, coords)
        when "Q "
          self.legal(self, coords)
        when "K "
          self.legal(self, coords)
      end
  end

end