class King < Piece
  attr_accessor :row, :column, :color, :type
  def initialize(row, column, color, type="K ")
    super
  end
 
#################################
# Checks legality of king move coords
# any direction 1 space
#### 
  def legal(coords)
    row_dist = (@row - coords[0]).abs
    col_dist = (@column - coords[1]).abs
    if row_dist > 1 || col_dist > 1
      return false
    elsif check
      puts "cant move into check"
      return false
    else
      return occupied?(coords)
    end
  end

#################################
#
#### 

def check
  directions = [[1, 0], [-1, 0], [0, 1], [0, -1],
                [1, 1], [-1, 1], [1, -1], [-1, -1]]
  directions.each do |dx, dy|
    to = [self.row, self.column]
     steps = 0
    while true
      to = [self.row + dx, self.column + dy]
      steps += 1
      break if to[0] > 8 || to[0] < 0
      break if to[1] > 8 || to[1] < 0
      # next if @board.empty? to
      # break if @board.color_of_piece_on(to) == color
      piece = find_piece(to)
      if piece
        break if piece.color == self.color
      else
        next
      end

      case piece.type
        when "K "  then return true if piece.legal[to] = "true"
        when "Q " then return true if piece.legal[to] = "true"
        when "R " then return true if piece.legal[to] = "true"
        when "B " then return true if piece.legal[to] = "true"
        when "H " then return true if piece.legal[to] = "true"
        when "P " then return true if piece.legal[to] = "true"
      end
      break
    end
  end
  false
end

def find_piece(coords)
  @pieces = Piece.all
  @pieces.each do |piece|
    if piece.row == coords[0] && piece.column == coords[1]
        # return result of color_check -> attack -> t/f
      return piece
    else
      return false
    end
  end
end

  def attacked_by_a_knight?(from)
    positions = [[from.x + 2, from.y + 1], [from.x + 2, from.y - 1],
                 [from.x - 2, from.y + 1], [from.x - 2, from.y - 1],
                 [from.x + 1, from.y + 2], [from.x + 1, from.y - 2],
                 [from.x - 1, from.y + 2], [from.x - 1, from.y - 2]]
    positions.any? do |position|
      square = Square.new(*position)
      @board.piece_on(square).is_a? Knight and @board.piece_on(square).color != color
    end
  end
end