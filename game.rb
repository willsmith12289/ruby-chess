class Game
  require_relative 'board'
  require_relative 'piece'
  require_relative 'pawn'
  require_relative 'rook'
  require_relative 'knight'
  require_relative 'bishop'
  require_relative 'queen'
  require_relative 'king' 
  require './input'
  include Input

  def initialize
    build_pieces
    @pieces = Piece.all
    Board.new(@pieces)
    game_loop
  end

#################################
# array of all columns or "files" on board
####
  def files
    ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
  end

#################################
# Builds each piece and assigns it color and starting coords
####
  def build_pieces
    (1..8).each do |i|
      Pawn.new(2, i, "white") 
    end
      Rook.new(1, 1, "white")
      Knight.new(1, 2, "white")
      Bishop.new(1, 3, "white")
      Queen.new(1, 4, "white")
      King.new(1, 5, "white")
      Bishop.new(1, 6, "white")
      Knight.new(1, 7, "white")
      Rook.new(1, 8, "white")
    (1..8).each do |i|
      Pawn.new(7, i, "black") 
    end
      Rook.new(8, 1, "black")
      Knight.new(8, 2, "black")
      Bishop.new(8, 3, "black")
      Queen.new(8, 4, "black")
      King.new(8, 5, "black")
      Bishop.new(8, 6, "black")
      Knight.new(8, 7, "black")
      Rook.new(8, 8, "black")
  end

#################################
# Loops until win = true
# sets who to result of calling turn
# chooses piece, then desired move
# checks legality
# redraws board
####
  def game_loop
    until win?
      who = turn(who)
      puts "#{ who }'s turn"
      piece = choose_piece
      move_coord = choose_square
      if piece.move(move_coord, who)
        @pieces = Piece.all
        Board.new(@pieces)
      else
        who = "illegal"
      end
    end
  end

#################################
# Determines which players turn is up
####
  def turn(who) 
    if who == nil
      who = "black"
    elsif who == "black"
      who = "white"
    elsif who == "white"
      who = "black"
    elsif who == "illegal"
      who = prev
    end
    prev = who
    return who
  end

#################################
# Loops through all pieces and matches them with input coords
####
  def choose_piece
    puts "choose piece row"
    row = gets.chomp.to_i
    puts "choose piece column"
    col = gets.chomp
    column = (files.index(col).to_i) + 1
    pieces = Piece.all
    pieces.each do |piece|
      if piece.row == row && piece.column == column
        return piece
      end
    end
  end

#################################
# Grabs move coords based on input coords
####
  def choose_square
    puts "choose move row"
    row = gets.chomp.to_i
    puts "choose move column"
    col = gets.chomp
    column = (files.index(col).to_i) + 1
    to = [row, column]
    return to
  end

#################################
# determines if either player won, temp set to false
####
  def win?
    false
  end

end
g = Game.new