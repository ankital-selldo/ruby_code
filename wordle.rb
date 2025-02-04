class Wordle
    def initialize
        @counter = 0
        # wordle_word = Random input from words.txt
        @wordle_word = "brave"
    end

    def Wordle_Solver
        #Extracting only the text
        english_words = File.readlines("words.txt").map(&:strip).map(&:downcase)

        #Took word from user
        while @counter < 6
            puts "Give your word as input : "
            user_word = gets.chomp

            if is_valid(user_word) && is_english_word_and_not_gibberish(user_word, english_words)
                if check_for_chars(user_word)
                    puts "WIN.... Your word matched : #{@wordle_word}"
                    break
                end
            else
                puts "Invalid word!?"
            end


            @counter += 1
        end
    end

    def is_valid(user_word)
        user_word.length == 5 ? true : false
    end

    def is_english_word_and_not_gibberish(user_word, english_words)
        english_words.include?(user_word) ? true : false
    end


    def check_for_chars(user_word)
        green = []
        yellow = []
        grey = []
        #loop over entire word & do
        #check char if same index -> green
        # if not same index -> yellow
        # if not both -> grey

        # green = [_,r,_,_,_] yellow = [e, ] grey = [g, e, n]
        # once the ith letter is in green array & just do continue no need to check next conditions


        # put a frequency check -> maintain a hash for letters in wordle_word 
        # if freq is 0 -> means that letter is not present
        # tally method

        # taking count 
        hash_for_freq = Hash.new

        # w = ['b', 'r', 'a', 'v', 'e']
        @wordle_word.chars.each do |c|
            if hash_for_freq[c]
                hash_for_freq[c] += 1
            else
                hash_for_freq[c] = 1
            end
        end

        
        #word - green wordle - brave

        j = -1
        for i in (0..4)
            j += 1
            if user_word[j] == @wordle_word[j]
                green.push(user_word[j])
                next
            elsif @wordle_word.include?(user_word[j]) 
                    next grey.push(user_word[j]) if hash_for_freq[user_word[j]] == 0

                    hash_for_freq[user_word[j]] = hash_for_freq[user_word[j]] - 1
                    yellow.push(user_word[j])
            else 
                grey.push(user_word[j])
            end
        end

        puts "Green : "
        puts green
        puts "Yellow : "
        puts yellow
        puts "Grey : "
        puts grey
        puts "END"

        if green.size == 5
            true
        end
    end
end

hash = {
    1 => "test"
}
w = Wordle.new
w.Wordle_Solver
