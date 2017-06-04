class Pawn < Piece
  attr_accessor :row, :column, :color, :type, :first
  def initialize(row, column, color, type="P ")
    super
    @first = true
  end

  def legal(piece_instance, coords)
    @first_black = [piece_instance.row.to_i-2, piece_instance.column.to_i]
    @first_white = [piece_instance.row.to_i+2, piece_instance.column.to_i]
    @reg_black = [piece_instance.row.to_i-1, piece_instance.column.to_i]
    @reg_white = [piece_instance.row.to_i+1, piece_instance.column.to_i]
    @attack_black = [
      [piece_instance.row.to_i-1, piece_instance.column.to_i+1],
      [piece_instance.row.to_i-1, piece_instance.column.to_i-1]
    ]
    @attack_white = [
      [piece_instance.row.to_i+1, piece_instance.column.to_i+1],
      [piece_instance.row.to_i+1, piece_instance.column.to_i-1]
    ]
    @coords_x = coords[0].to_i
    @coords_y = coords[1].to_i

    if @first
        # first black pawn +2
      if @coords_x === @first_black[0].to_i && @coords_y === @first_black[1].to_i
        @first = false
        return true

        # first white pawn +2
        elsif @coords_x === @first_white[0].to_i && @coords_y === @first_white[1].to_i
          @first = false
          return true

          #first black pawn regular
        elsif  @coords_x === @reg_black[0].to_i && @coords_y === @reg_black[1].to_i
          @first = false
          return true

          #first white pawn regular
        elsif @coords_x === @reg_white[0].to_i && @coords_y === @reg_white[1].to_i
          @first = false
          return true 
        else
          return false
      end
      # regular forward move not first
      elsif (@coords_x === @reg_black[0].to_i && @coords_y === @reg_black[1].to_i)
        return true
      elsif (@coords_x === @reg_white[0].to_i && @coords_y === @reg_white[1].to_i)
        return true
    # elsif attack?
    #   return true
      else
        return false
    end
  end

  def attack?(piece_instance)
    @coords_x = coords[0].to_i
    @coords_y = coords[1].to_i
  end

end