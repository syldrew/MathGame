require_relative 'player'
require_relative 'question'

class Game
  def initialize
    @players = [Player.new("P1"), Player.new("P2")]
    @current_player = 0
  end

  def start
    puts "Welcome to the Math Game!"

    loop do
      current_player = @players[@current_player]
      other_player = @players[1 - @current_player]

      puts "#{current_player.name}'s turn:"
      question = Question.new
      puts question.text

      answer = gets.chomp.to_i

      if question.correct?(answer)
        puts "Yes! you are correct Your score: #{current_player.score}"
      else
        current_player.lose_life
        puts "Seriously? No! #{current_player.name} loses a life. #{current_player.name}'s lives: #{current_player.lives}"
      end

      puts "Score: #{current_player.name}: #{current_player.score} | #{other_player.name}: #{other_player.score}"

      if current_player.game_over?
        puts "#{other_player.name} wins with a score of #{other_player.score}!"
        puts "----- GAME OVER -----"
        puts "Good bye!"
        break
      end

      puts "----- NEW TURN-----"
      @current_player = 1 - @current_player
    end
  end
end

