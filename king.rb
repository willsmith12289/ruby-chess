class King < Piece
  attr_accessor :row, :column, :color, :type
  def initialize(row, column, color, type="K ")
    super
  end
  
  def legal(piece_instance, coords)
    @coords_x = coords[0].to_i
    @coords_y = coords[1].to_i
    @moves = Array.new()
    @moves << [piece_instance.row.to_i+1, piece_instance.column.to_i]
    @moves << [piece_instance.row.to_i-1, piece_instance.column.to_i]
    @moves << [piece_instance.row.to_i, piece_instance.column.to_i-1]
    @moves << [piece_instance.row.to_i-2, piece_instance.column.to_i+1]

    @moves.each do |move|
      if @coords_x === move[0].to_i && @coords_y === move[1].to_i
        return true
      else
        next
      end
    end
    return false
  end
end