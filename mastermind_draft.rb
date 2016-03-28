  #      require "pry"; binding.pry
  #
 # 2. The user inputs a guess, or selects from two options
  #     a. If the user enters 'q' or 'quit', then exit the games
  #     b. If the user enters 'c' or 'cheat', then print out the secret code
  # 3. if Guess is invalid, reject
  #     a. if the guess < 4 letters, tell the user guess is too short
  #     b. if the guess > 4 letters, tell the user guess is too long
  # 4. After every valid guess
  #     a. Tell the user # of correct elements in the guess
  #     b. Tell the user # of correct positions in the guess
  # 5. If the guess is the secret code
  #     a. End the game
  #     b. Tell the user that their guess was correct, stop the timer   
  #     c. Ask the user if they want to play again 
  # 
class Master
  
  # Start the main menu, ask user for input and validate user input 
  # Ask user if they want to play, read instruction or quit and
  # make sure they enter a valid choice.
  #
  # Create (instantiate) new game if user selects 'p'
  # Print instructions to screen if user selects 'i'
  # Exit the ruby program if user selects 'q'

  def display_main_menu
    waiting_for_input = true
    
    while waiting_for_input
      puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
      print "> " 
    
      user_selection = gets.chomp # exclude the \n character
      
      case user_selection
      when "p"
        waiting_for_input = false
        new_game 
      when "i"
        waiting_for_input = false
        display_instructions 
      when "q"  
        waiting_for_input = false
        exit
      else
        puts "Sorry, that is not a valid choice."
      end
    end

  end

  # Create a new Game instance

  def new_game 
    Game.new.play_game
  end

  def display_instructions
    puts "Welcome to MasterMind"
    puts ""
    main_menu 
  end

end

class Game

  # initialize all the attributes of the Game
  # 1. the initial game must be set up 
  #     a. beginning prompt is displayed
  #     b. secret code is generated and stored
  #     c. start the timer 
 
  def initialize
    @colors = { 0 => "R", 1 => "G", 2 => "B", 3 => "Y" }
    @secret_code = generate_code 
    @correct_colors = 0
    @correct_positions = 0
    # @guess_history = GuessHistory.new
  end

  def calculate_time(start, stop)
    time_elapsed = stop - start
    minutes = time_elapsed.to_i / 60
    seconds = time_elapsed.to_i % 60
    "#{minutes} minutes, #{seconds} seconds"
  end

  def generate_code
    4.times.map { (@colors[rand(4)])}.join
  end

  # Main game logic - keep asking user for guesses
  # until the user guesses correctly!
  # Allow the user to play n guesses

  def play_game 

   @number_guesses = 0
   @start_time = Time.now
   puts "I have generated a secret code, a sequence of four colors: (R)ed, (G)reen, (B)lue, and (Y)ellow"

   game_over = false 

   until game_over 
         
     guess = get_guess

     exit if guess.upcase == "Q" 
     guess = @secret_code if guess.upcase == "C" # provide option to cheat

     if validate_guess(guess)
       @number_guesses += 1
       guess_report(guess) 
       if guess.upcase == @secret_code
         game_over = true 
         @end_time = Time.now
         game_time = calculate_time(@start_time, @end_time)  
         puts "Congrats you won! You guessed the secret code '#{@secret_code}' in #{@number_guesses} guesses in #{game_time}"

         Master.new.display_main_menu
       else 
         puts "Please guess again." 
       end
     end
   end
  end

 #    waiting_for_input = true

 #    while waiting_for_input
 #      puts "Would you like to (p)lay again or (q)uit?"
 #      print "> "
 #      input = gets.chomp

 #      case input
 #      when "p"
 #        play_game
 #        waiting_for_input = false
 #      when "q"   
 #        exit
 #      else
 #        puts "That is not valid input."
 #      end
 #    end
 #   end
 #   end
 # end

  def validate_guess(guess)
    valid_chars?(guess) && valid_length?(guess) 
  end

  def valid_length?(guess) 

    unless guess.length == @secret_code.length
      if guess.length < @secret_code.length
        puts "Guess is too short." 
        false
      elsif guess.length > @secret_code.length 
        puts "Guess is too long."
        false
      end
    else
     true 
    end
  end

  # check to see if the guess contains anything that is not an available color 

  def valid_chars?(guess)
   if !guess.upcase.each_char.all? { |char| @colors.has_value? char }
     puts "That is not a valid guess. Please guess from #{@colors.values}"
     false
   else
     true
   end 
  end

  def get_guess
    print "What's your guess? > "
    gets.chomp
  end 

  # Tell the user how many colors and positions they got correct on the last guess

  def guess_report(guess)
    number_colors_correct = check_color(guess) 
    number_positions_correct = check_position(guess) 
    puts "'#{guess}' has #{number_colors_correct} of the correct colors with #{number_positions_correct} in the correct positions"
    puts "You've taken #{@number_guesses} guesses."
  end

  def check_color(guess)
     count = 0
     # only loop through unique colors
     guess.upcase.chars.uniq.each do |char| 
       if @secret_code.include? char
        count += 1 
       end
      end
     return count 
  end

  def check_position(guess)
  #     for each letter in guess, check if color AND position matches @secret_code 
    count = 0
    @secret_code.chars.each_index do |index|
      if guess.upcase[index] == @secret_code[index]
        count += 1
      end
    end
    return count
  end
  

  def display_history
  # TODO: Return something
  end
end



# class GuessHistory
#   def initialize
#     @guess_history = [] 
#   end
# 
#   def add_history(guess)
#   end
# 
#  #  def get_history
#  #    @guess_history
#  #  end
# end

mastermind = Master.new
puts "Welcome to MASTERMIND"
mastermind.display_main_menu

