# require "./lazychess/version"
Dir["./lib/lazychess/*.rb"].each {|file| require file }
Dir["./lib/concepts/*.rb"].each {|file| require file }
Dir["./lib/services/*.rb"].each {|file| require file }

module Lazychess
  current_player = :white
  game = Game.new

  puts "Time to play some mafakan chess!!"
  puts "White begins:"

  until game.has_been_won? do
    puts BoardPrinter.new.print(game.board)
    puts "Enter move:"
    move = gets.chomp
    game.board.move(current_player, move)

    current_player == :white ? current_player = :black : current_player = :white

    puts "#{current_player}'s move:"
  end
end
