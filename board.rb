class Board
  require_relative 'square'
  require 'colorize'
  def initialize(pieces)
    @board = build_board(pieces)
    show
  end

#################################
# Shortened syntax of print board, colorize blue and red
####
    def show
        print_board(@board)
    end

    def blue(text)
        # "\e[30m\e[47m#{text}\e[0m"
        text.colorize(:background => :light_blue)
    end

    def red(text)
        # "\e[47m\e[40m#{text}\e[0m"
        text.colorize(:background => :red)
    end

#################################
# Creates an array of row passed from print_board
# Assigns color to each item based on index being even or odd
# Prints square of that color for each item in row
####
    def striped_array(text, start_white)
        remainder = start_white ? 0 : 1 #true : false
        text.each_with_index do |item,index|
            if index % 2 == remainder
                print red(item)
            else
                print blue(item)
            end
        end
        puts 
    end

##################################
# prints one row at a time
# first squares color determined by rows index being even or odd
####
    def print_board(board)
        board.each_with_index do |row, index|
          #index % 2 == 1 means is index % 2 = 1? true or false?
            striped_array(row, index % 2 == 1)
        end
    end


#################################
# Builds an array with 8 items(rows); each with 8 items(columns)
# sets each column to blank space "  ", allowing for colorize
# Prints Piece type according to color, and coords 
####
    def build_board(pieces)
        chess_board = [
             ["  ", "  ", "  ", "  ", "  ", "  ", "  ", "  "],
             ["  ", "  ", "  ", "  ", "  ", "  ", "  ", "  "],
             ["  ", "  ", "  ", "  ", "  ", "  ", "  ", "  "],
             ["  ", "  ", "  ", "  ", "  ", "  ", "  ", "  "],
             ["  ", "  ", "  ", "  ", "  ", "  ", "  ", "  "],
             ["  ", "  ", "  ", "  ", "  ", "  ", "  ", "  "],
             ["  ", "  ", "  ", "  ", "  ", "  ", "  ", "  "],
             ["  ", "  ", "  ", "  ", "  ", "  ", "  ", "  "]
            ]
        pieces.each do |piece|
            x = piece.row.to_i
            y = piece.column.to_i
          if piece.color == "white" 
            chess_board[x][y] = piece.type.colorize(:color => :white)
          else
            chess_board[x][y] = piece.type.colorize(:color => :black)
          end
        end
        chess_board
    end


#################################
# Highlights chosen move coords
####
    def highlight_square

    end
end