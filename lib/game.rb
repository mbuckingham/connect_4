require 'pry'

require_relative "board"
require_relative "player"
require_relative "turn"
require_relative "board_space"

puts "Welcome to Connect Four! \n\n"

puts "Player 1: What is your name?"
x_player_name = gets.chomp

puts "\nPlayer 2: What is your name?"
o_player_name = gets.chomp

if x_player_name != o_player_name
  puts "\n#{x_player_name}, you will be x's."
  puts "#{o_player_name}, you will be o's."
else
  puts "Please enter a valid name."
  o_player = gets.chomp
end

puts "\n\nLet' play!\n\n"

board = Board.new
board.print_board

x_player = Player.new(x_player_name, 'x')
o_player = Player.new(o_player_name, 'o')
players = [x_player, o_player].shuffle

turn_index = 0
while board.empty_space? && !board.winner?

  current_player = players[turn_index]
  puts "It is #{current_player.player}'s turn."
  puts "What column do you want to play?"
  column_index = gets.chomp.to_i

  if column_index >= 0 && column_index <= 7
    board.empty_column?(column_index)
    board.add_turn(current_player, column_index)

    puts board.print_board

    turn_index = turn_index == 0 ? 1 : 0

  else
    puts "Invalid column. What column would you like to play?"
    column_index = gets.chomp.to_i
  end
end

if board.winner?
  puts "\n#{current_player.player} wins!"
end
