class Queen < Piece
  attr_accessor :row, :column, :color, :type
  def initialize(row, column, color, type="Q ")
    super
  end

#################################
# Checks legality of Queens moves
# Can move forward back side diagonal as many as possible
# cant jump
####
  def legal(coords)
    if possible_moves.include? [coords[0], coords[1]]
      puts "includessss"
      attack_or_move(coords)
    else

      return false
    end
  end


#################################
# loop through possible moves, add to array
####
  def possible_moves
    moves = []
    
    (1..7).each do |x|
      (@row + x > 7)? x_1 = nil : x_1 = @row + x
      (@row - x < 0)? x_2 = nil : x_2 = @row - x
      (@column + x > 7)? y_1 = nil : y_1 = @column + x
      (@column - x < 0)? y_2 = nil : y_2 = @column - x
      
      moves << [x_1, @column]
      moves << [x_2, @column]
      moves << [@row, y_1]
      moves << [@row, y_2]
      moves << [x_1, y_1]
      moves << [x_2, y_1]
      moves << [x_1, y_2]
      moves << [x_2, y_2]
    end
    moves.delete_if {|moves| moves.include?(nil)}
    return moves
  end
end