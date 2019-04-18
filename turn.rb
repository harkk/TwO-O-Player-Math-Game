require_relative "player"

class Turn
  def initialize(player)
    @current_player = player 
  end

  def start_turn
    answer = generate_question
    display_question(answer[0], answer[1])
    guess = input_answer
    correct_guess = check_guess(guess, answer[0] - answer[1])
  end

  def input_answer
    puts "#{@current_player.name}, please input your answer: "
    guess = gets.chomp.to_i
    return guess
  end

  def generate_question
    number1 = Random.new.rand(20)
    number2 = Random.new.rand(20)
    return [number1, number2]
  end

  def display_question(number1, number2)
    puts "What is #{number1} - #{number2}?"
  end

  def check_guess(guess, answer)
    if guess != answer
      @current_player.lose_life
      puts "Incorrect!  #{@current_player.name} loses a life. #{@current_player.lives} lives left!"
    else
      puts "Correct!  #{@current_player.name} still has #{@current_player.lives} lives!"
    end
  end

end