class Mastermind
    attr_reader :secret_code, :attempt
    attr_accessor :secret_code, :input, :attempt
    def initialize
        @secret_code = secret_code
        @input = input
    end
    def welcome
        puts "Welcome to MASTERMIND!"
        code_generator
        repl
    end

    def repl
        puts "Would you like to (p)lay, read the (i)nstructions or (q)uit?"
        @input = gets.chomp.to_s.downcase
        if input == "p"
            puts "Guess the secret code"
            code_length
        elsif input == "i"
            instructions
            input2 = gets.chomp.to_s.downcase
                if input2 == "p" || input2 == "play"
                    puts "Guess the secret code"
                    puts code_length
                elsif input2 == "q" || input2 == "quit"
                    puts "You decided to quit the game. Come back to play sometime, it's fun."
                else
                end
        elsif input == "q" || input == "quit"
            puts "You decided to quit the game. Come back to play sometime, it's fun."
        elsif input == "c" || input == "cheat"
            cheat
        else
            puts "Type p to play, i for instructions or q to quit"
        end
    end
    def instructions
        puts "The goal of Mastermind is to guess a secret code which consists of four elements made up of R (red), G (green), B (blue) and Y (yellow). If you don't guess the code, you'll get a message telling you if you correctly chose one of the colors of the code and if you put it in the right position or in a different one. Press (p)lay to start the game. Use (q)uit anytime to end the game."
    end
    def code_generator
        colors = ["r","b","g", "y"]
        colors4 = colors * 4
        @secret_code = colors4.shuffle.take(4)
    end
    def eval
        input = []
        a = first_position_correct
        b = second_position_correct
        c = third _position_correct
        d = fourth_position_correct
        if input[0] == input = secret_code[1] || input = secret_code[2] || input = secret_code[3]
            puts "You have guess one element but it's in the wrong place"
        if input[1] == input = secret_code[0] || input = secret_code[2] || input = secret_code[3]
            puts "You have guess one element but it's in the wrong place"
        if input[2] == input = secret_code[0] || input = secret_code[1] || input = secret_code[3]
            puts "You have guess one element but it's in the wrong place"
        if input[3] == input = secret_code[0] || input = secret_code[1] || input = secret_code[2]
            puts "You have guess one element but it's in the wrong place"
        else
            puts "You have guessed 0 elements"
        end
    end
    def guess
    end
    def feedback
        if input == secret_code
            puts "Congratulations! You guessed the code #{secret_code} in *** guesses over *** minutes and *** seconds"
        else
            puts "#{user_code} has #{n} of the correct elements with #{n2} in the correct position. You have taken #{attempt} #{guess_es}"
            code_length
        end
    end
    def attempt_counter
       @attempt = 0
        unless input == secret_code
            attempt = count +=1
            else
        end
    end
    def guess_es
        if attempt >= 0
            puts "guess"
        else
            puts "guesses"
        end
    end
    def track_time
        t.strftime("%H:%M:%Y")
    end
    def cheat
        p @secret_code.join.upcase
    end
    def code_length
        puts "Enter your guess of the four letters secret code"
        guess = gets.chomp.to_s.downcase
            if guess == "q" || guess == "quit"
                puts "You decided to quit the game. Come back to play sometime, it's fun."
            else
            end

        if guess.length == 4
                    eval
                elsif guess.length > 4
                    puts "The code is too long."
                    code_length
                else
                    puts "The code is too short."
                    code_length
                end
    end
end
Mastermind.new.welcome
