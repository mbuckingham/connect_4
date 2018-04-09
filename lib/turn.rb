require 'pry'

require_relative "board"
require_relative "board_space"
require_relative "player"

class Turn
  attr_reader :board, :player, :row_index, :column_index

  def initialize(board, player, column_index, row_index = 0)
    @board = board
    @player = player
    @row_index = row_index
    @column_index = column_index  - 1
  end

  def column_full?
    @board.board[0][@column_index].occupied?
  end

  def take!
    if @board.board[0][@column_index].occupied?
      puts "Sorry! This column is full."
    elsif @board.board[1][@column_index].occupied?
      @board.board[@row_index = 0][@column_index].cell = @player
    elsif @board.board[2][@column_index].occupied?
      @board.board[@row_index = 1][@column_index].cell = @player
    elsif @board.board[3][@column_index].occupied?
      @board.board[@row_index = 2][@column_index].cell = @player
    elsif @board.board[4][@column_index].occupied?
      @board.board[@row_index = 3][@column_index].cell = @player
    elsif @board.board[5][@column_index].occupied?
      @board.board[@row_index = 4][@column_index].cell = @player
    else @board.empty_column?(@column_index)
      @board.board[@row_index = 5][@column_index].cell = @player
    end
  @board
  end

  def win?
    horizontal_win? || vertical_win?
  end

  def horizontal_win?
    4.times do |n|
      if check_row(@board.board[@row_index][n..n + 3])
        return true
      end
    end
    return false
  end

  def vertical_win?
    3.times do |n|
      if check_column(@board.board[n..n + 3])
        return true
      end
    end
    return false
  end

  def check_row(array)
    victory = false
    characters = []
    array.each do |space|
      if !space.cell.nil?
        characters << space.cell.character
      end
    end
    if characters.count >= 4 && characters.uniq.length == 1 && characters.first != nil
      victory = true
    end
    victory
  end

  def check_column(array)
    victory = false
    characters = []
    array.each do |row|
      if !row[@column_index].cell.nil?
        characters << row[@column_index].cell.character
      end
    end
    if characters.count >= 4 && characters.uniq.length == 1 && characters.first != nil
      victory = true
    end
    victory
  end
end
