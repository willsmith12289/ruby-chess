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
    puts "blacks turn"
    game_loop
    # show_single_key while(true)
  end

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

  def game_loop
    until win?
      @piece = choose_piece
      @move = choose_square
      @piece.move(@move)
      Board.new(@pieces)
    end
  end

  def choose_piece
    puts "choose row"
    row = gets.chomp
    puts "choose column"
    column = gets.chomp
    @from = [row, column]
    @pieces.each do |piece|
      if piece.row === @from[0].to_i && piece.column === @from[1].to_i
        return piece
      end
    end
  end

  def choose_square
    puts "choose row"
    row = gets.chomp
    puts "choose column"
    column = gets.chomp
    @to = [row, column]
    return @to
  end

  def win?
    false
  end

end
g = Game.new