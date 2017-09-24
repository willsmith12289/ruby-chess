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
  def move(coords, who)
    if piece_legal_controller(coords)
      if self.color == who
        @row = coords[0].to_i
        @column = coords[1].to_i
      else
        puts who
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
        occupied = color_check(piece)
        return occupied
      end
    end
  end

#################################
# Removes opposing piece
# switches its coords with its own
####
def attack(dead_piece)
  dead_piece.row = nil
  dead_piece.column = nil
  dead_piece.color = nil
  dead_piece.type = nil
  dead_piece = nil
  return true
end

#################################
# Removes opposing piece
# switches its coords with its own
####
def color_check(piece)
  if piece.color === self.color
    puts "cant attack same color"
    return false
  elsif piece.color != self.color
    return attack(piece)
    puts "attack!"
    # return true
  end
end
  private

#################################
# Check legality according to piece type
####
  def piece_legal_controller(coords)
    @piece = self
    # # calls occupied to determine if desired coords are open
    # if occupied?(coords)
    #   dead_piece = occupied?(coords)
    #   color_check(dead_piece)
    # else
      case @piece.type
        when "P "
          # puts @piece
          @piece.legal(@piece, coords)
        when "R "
          @piece.legal(@piece, coords)
        when "H "
          @piece.legal(@piece, coords)
        when "R "
          @piece.legal(@piece, coords)
        when "B "
          @piece.legal(@piece, coords)
        when "Q "
          @piece.legal(@piece, coords)
        when "K "
          @piece.legal(@piece, coords)
      end
  end

end