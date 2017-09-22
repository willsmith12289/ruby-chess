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
  def move(coords)
    if piece_legal_controller(coords)
      @row = coords[0].to_i
      @column = coords[1].to_i
      return true
    else
      return false
    end
  end

#################################
# Loops through all pieces to determine if desired coords are occupied
####
  def occupied?(coords)
    @piece = self
    puts @piece.color
    @pieces = Piece.all
    # loop through all pieces to find any in move coords
    @pieces.each do |piece|
     # puts piece
      puts coords[0].to_i
      puts piece.row.to_i
      if piece.row.to_i == coords[0].to_i && piece.column.to_i == coords[1].to_i
        return true
      end
    end
    return false
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


#################################
# Removes opposing piece
# switches its coords with its own
####
def color_check(piece)
  if piece.color === self.color
    puts "cant attack same color"
    return false
  elsif piece.color != self.color
    puts "attack!"
    attack(piece)
    return true
  end
end
#################################
# Removes opposing piece
# switches its coords with its own
####

def attack(dead_piece)
  puts dead_piece.color
  @pieces = Piece.all
  @pieces.delete_if { |e| e == dead_piece }
  puts @pieces
  #return true
#   case @piece.type
  #   when "P "
  #     # puts @piece
  #     @piece.attack(@piece, dead_piece)
  #   when "R "
  #     @piece.attack(@piece, dead_piece)
  #   when "H "
  #     @piece.attack(@piece, dead_piece)
  #   when "R "
  #     @piece.attack(@piece, dead_piece)
  #   when "B "
  #     @piece.attack(@piece, dead_piece)
  #   when "Q "
  #     @piece.attack(@piece, dead_piece)
  #   when "K "
  #     @piece.attack(@piece, dead_piece)
  # end
end
end