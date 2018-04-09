require_relative "board_space"
require_relative "turn"

class Board
  attr_accessor :board, :rows, :columns

  def initialize(rows = 6, columns = 7)
    @board = []
    rows.times do
      row = []
      columns.times do
        row << BoardSpace.new
      end
      @board << row
    end
  end

  def print_board
  print_board = ''
    @board.each_with_index do |row, index|
      cells = []
        row.each do |gamespot|
            cells << gamespot.to_char
        end
        print_board << "|" + cells.join('') + "|" + "\n"
      end
      print_board << "|_____________________|" + "\n"
      print_board << "  1  2  3  4  5  6  7 "
    puts print_board
  end

  def empty_column? (column_index)
    empty_column = true
    @board.each do |row|
      if !row[column_index - 1].nil?
        empty_column == false
      end
    end
    empty_column
  end

  def add_turn(player, column)
    @last_turn = Turn.new(self, player, column)
    if @last_turn.column_full?
      puts "Choose another column:"
      column_index = gets.chomp.to_i
      @last_turn = Turn.new(self, player, column_index)
      @last_turn.take!
    else
      @last_turn.take!
    end
  end

  def empty_space?
    @board.each do |row|
      row.each do |space|
        return true if !space.occupied?
      end
    end
    return false
  end

  def winner?
    if @last_turn
      @last_turn.win?
    else
      false
    end
  end
end
