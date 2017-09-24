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
    #b.show
    game_loop
    # show_single_key while(true)
  end

#################################
# Builds each piece and assigns it color and starting coords
####
  def build_pieces
    (0..7).each do |i|
      Pawn.new(1, i, "white") 
    end
      Rook.new(0, 0, "white")
      Knight.new(0, 1, "white")
      Bishop.new(0, 2, "white")
      Queen.new(0, 3, "white")
      King.new(0, 4, "white")
      Bishop.new(0, 5, "white")
      Knight.new(0, 6, "white")
      Rook.new(0, 7, "white")
    (0..7).each do |i|
      Pawn.new(6, i, "black") 
    end
      Rook.new(7, 0, "black")
      Knight.new(7, 1, "black")
      Bishop.new(7, 2, "black")
      Queen.new(7, 3, "black")
      King.new(7, 4, "black")
      Bishop.new(7, 5, "black")
      Knight.new(7, 6, "black")
      Rook.new(7, 7, "black")
  end

#################################
# Loops until win = true
# chooses piece, then desired move
# checks legality
# redraws board
####
  def game_loop
    until win?
      who = turn(who)
      puts "#{ who }'s turn"
      @piece = choose_piece
      @move = choose_square
      if @piece.move(@move, who)
        @pieces = Piece.all
        Board.new(@pieces)
      else
        puts "Illegal Move!"
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
      who = @prev
    end
    @prev = who #black
    return who
  end

#################################
# Grabs piece based on input coords
####
  def choose_piece
    puts "choose row"
    row = gets.chomp.to_i
    puts "choose column"
    column = gets.chomp.to_i
    @pieces.each do |piece|
      if piece.row.to_i === row && piece.column.to_i === column
        return piece
      end
    end
  end

#################################
# Grabs move coords based on input coords
####
  def choose_square
    puts "choose row"
    row = gets.chomp
    puts "choose column"
    column = gets.chomp
    @to = [row, column]
    return @to
  end

#################################
# determines if either player won, temp set to false
####
  def win?
    false
  end

end
g = Game.new