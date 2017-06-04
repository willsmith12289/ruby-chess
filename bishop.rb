class Bishop < Piece
  attr_accessor :row, :column, :color, :type
  def initialize(row, column, color, type="B ")
    super
  end

  def legal(piece_instance, coords)
    @coords_x = coords[0].to_i
    @coords_y = coords[1].to_i

    possible_moves(piece_instance)
    puts "possible_moves"
    if piece_instance.row.to_i === @coords_x || piece_instance.column.to_i === @coords_y
      return false
    else
      return true
    end
  end

  def possible_moves(piece_instance)
    # loop through possible moves, add to array if no piece occupies spot
    row = piece_instance.row.to_i
    column = piece_instance.column.to_i
    @color = piece_instance.color
    @moves = Array.new()
      until row >= 7 || column >= 7
          row += 1
          column += 1
          move = [row, column]
          puts "row"
          puts row
          puts "column"        
          puts column
          if no_piece(move)
            @moves << move
          end
      end
  end

  def no_piece(move)
    @pieces = Piece.all
    @pieces.each do |piece|
      #if any piece is in same spot as move return false
      if piece.row.to_i === move[0] && piece.column.to_i === move[1]
        return false
      else
        return true
      end
    end
  end
end