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
  def legal(this, coords)
    start = [this.row.to_i, this.column.to_i]
    piece_location = obstruction?(start, coords)
    if piece_location == coords
      puts "location = coords"
      occupied = this.occupied?(coords)
      return occupied
    # if location of obstruction returned false, move piece
    elsif !piece_location
      puts "false"
      occupied = this.occupied?(coords)
      return occupied
    else
      puts "piece in the way"
      return false
    end
  end

end