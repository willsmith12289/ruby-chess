class Board
  require_relative 'square'
  require 'colorize'
  def initialize(pieces)
    @board = build_board(pieces)
    show
  end

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

    def striped_array(text, start_white)
        remainder = start_white ? 0 : 1
        text.each_with_index do |item,index|
            if index % 2 == remainder
                print red(item)
            else
                print blue(item)
            end
        end
        puts 
    end

    def print_board(board)
        board.each_with_index do |row, index|
            striped_array(row, index % 2 == 1)
        end
    end

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

    def highlight_square

    end
end