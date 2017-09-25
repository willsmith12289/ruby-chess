#################################
# Moves one square in any direction
#### 
class King < Piece
  attr_accessor :row, :column, :color, :type
  def initialize(row, column, color, type="K ")
    super
  end

#################################
# defines Offsets
####
  # def offsets
  #   diagonal + horizontal_vertical
  # end
 
# #################################
# # Creates possible moves array
# # adds all possible moves to it
# #### 
#   def moves
#     possible_moves = []
#     offsets.each do |offset|
#       prev_position = [@row, @column]
#       while true
#         new_pos = [(prev_position[0] + offset[0]), (prev_position[1] + offset[1])]
#         break unless position_in_bounds?(new_pos)
#         occupied = this.occupied?(new_pos)
#         possible_moves << new_pos if !occupied
#         break if occupied
#         prev_position = new_pos
#       end
#     end
#     possible_moves
#   end

#################################
# Checks legality of king move coords
# loops through possible moves to see if contains move coords 
#### 
  def legal(this, coords)
    row_distance = (this.row.to_i - coords[0].to_i).abs
    col_distance = (this.column.to_i - coords[1].to_i).abs
    puts row_distance
    puts col_distance
    if row_distance > 1 || col_distance > 1
      return false
    else
      occupied = this.occupied?(coords)
      return occupied
    end
  end

#################################
#
#### 
  # def check
  #   if 
  # end

#################################
#
#### 
  # def check_mate
  #   @moves = moves(self)
  #   @moves.each do |move|
  # end

end