class Pawn < Piece
  attr_accessor :row, :column, :color, :type, :first
  def initialize(row, column, color, type="P ")
    super
    @first = true
  end

#################################
#
####
  # def legal(piece_instance, coords)
  #   @first_black = [piece_instance.row.to_i-2, piece_instance.column.to_i]
  #   @first_white = [piece_instance.row.to_i+2, piece_instance.column.to_i]
  #   @reg_black = [piece_instance.row.to_i-1, piece_instance.column.to_i]
  #   @reg_white = [piece_instance.row.to_i+1, piece_instance.column.to_i]
  #   @attack_black = [
  #     [piece_instance.row.to_i-1, piece_instance.column.to_i+1],
  #     [piece_instance.row.to_i-1, piece_instance.column.to_i-1]
  #   ]
  #   @attack_white = [
  #     [piece_instance.row.to_i+1, piece_instance.column.to_i+1],
  #     [piece_instance.row.to_i+1, piece_instance.column.to_i-1]
  #   ]
  #   @coords_x = coords[0].to_i
  #   @coords_y = coords[1].to_i

  #   if @first
  #       # first black pawn +2
  #     if @coords_x === @first_black[0].to_i && @coords_y === @first_black[1].to_i
  #       @first = false
  #       return true

  #       # first white pawn +2
  #       elsif @coords_x === @first_white[0].to_i && @coords_y === @first_white[1].to_i
  #         @first = false
  #         return true

  #         #first black pawn regular
  #       elsif  @coords_x === @reg_black[0].to_i && @coords_y === @reg_black[1].to_i
  #         @first = false
  #         return true

  #         #first white pawn regular
  #       elsif @coords_x === @reg_white[0].to_i && @coords_y === @reg_white[1].to_i
  #         @first = false
  #         return true 
  #       else
  #         return false
  #     end
  #     # regular forward move not first
  #     elsif (@coords_x === @reg_black[0].to_i && @coords_y === @reg_black[1].to_i)
  #       return true
  #     elsif (@coords_x === @reg_white[0].to_i && @coords_y === @reg_white[1].to_i)
  #       return true
  #     elsif attacking
  #       return true
  #     else
  #       return false
  #   end
  # end
  # def moves
  #   move_offsets = []
  # end
  def legal(this, coords)
    # if first can move 2 forward
    if @first
      @first = false
      if (this.row.to_i - coords[0].to_i).abs == 2 || 1
        return true
      else
        return false
      end
    else
      # if not first move can only move 1 space
      if (this.row.to_i - coords[0].to_i).abs == 1
        # if columns of piece and coords same return true
        if this.column.to_i == coords[1].to_i
          puts "same col"
          return true

        # if columns are only dif by + or - 1
        elsif (this.column.to_i - coords[1].to_i).abs == 1
          # if space is occupied return true
          occupied = this.occupied?(coords)
          puts occupied
          return occupied
          #   puts "occupied"
          #   return true
          # end
          #   puts "not occupied"
          #   return false
        else
          puts "columns != && not occupied"
          return false
        end
        puts "greater than1.abs"
        return false
      end
    end ###
  end

#################################
#
####
  def attacking(attacked_)
    @coords_x = coords[0].to_i
    @coords_y = coords[1].to_i
  end

end