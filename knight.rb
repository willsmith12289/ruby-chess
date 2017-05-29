class Knight < Piece
  attr_accessor :row, :column, :color, :type
  def initialize(row, column, color, type="H ")
    super
  end
  
  def legal(piece_instance, coords)
    @moves = Array.new()
    @moves << [piece_instance.row.to_i-2, piece_instance.column.to_i+1]
    @moves << [piece_instance.row.to_i-2, piece_instance.column.to_i-1]
    @moves << [piece_instance.row.to_i+2, piece_instance.column.to_i+1]
    @moves << [piece_instance.row.to_i+2, piece_instance.column.to_i-1]
    @moves << [piece_instance.row.to_i+2, piece_instance.column.to_i-1]
    @moves << [piece_instance.row.to_i+2, piece_instance.column.to_i+1]
    @moves << [piece_instance.row.to_i-2, piece_instance.column.to_i-1]
    @moves << [piece_instance.row.to_i-2, piece_instance.column.to_i+1]
    @coords_x = coords[0].to_i
    @coords_y = coords[1].to_i
    
    @moves.each do |move|
      puts move
      if @coords_x === move[0].to_i && @coords_y === move[1].to_i
        return true
      else
        next
      end
    end
    return false  
  end
end