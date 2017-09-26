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
    destination_row = coords[0].to_i
    destination_col = coords[1].to_i
    print "coords:  "
    print coords
    #puts " "
    start = [this.row.to_i, this.column.to_i]
    if possible_moves(this).include? [destination_row, destination_col]
      puts "includessss"
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
    else

      return false
    end
  end


#################################
# loop through possible moves, add to array
####
  def possible_moves(this)
    row = this.row.to_i
    column = this.column.to_i
    # print row
    # print " : "
    # puts column
    # spaces left over in pieces row and column
    # spaces = [ 1, 2, 3, 4, 5, 6, 7 ]
    moves = []
    
    (1..7).each do |x|
      (row + x > 7)? x_1 = nil : x_1 = (row + x).to_i
      (row - x < 0)? x_2 = nil : x_2 = (row - x).to_i
      (column + x > 7)? y_1 = nil : y_1 = (column + x).to_i
      (column - x < 0)? y_2 = nil : y_2 = (column - x).to_i
      
      # moves << 
      m1 = [x_1, column]#nil, 3
      # moves << 
      m2 = [x_2, column]#6, 3
      moves <<
      m3 = [row, y_1]# 7, 4
      # moves << 
      m4 = [row, y_2]#
      # moves << 
      m5 = [x_1, y_1]
      # moves << 
      m6 = [x_2, y_1]
      # moves << 
      m7 = [x_1, y_2]
      # moves << 
      m8 = [x_2, y_2]
      moves.push(m1, m2, m3, m4, m5, m6, m7, m8)
    end
    moves.delete_if {|moves| moves.include?(nil)}
      moves.each do |move|
        # print "row: "
        # print move[0]
        # print ", column: "
        # puts move[1]
        print "move: "
        puts move
      end
    return moves
  end
end