from replit import clear
import random

from words import word_list
chosen_word = random.choice(word_list)
word_length = len(chosen_word)

end_game = False
lives = 6

from stages import stages
print("Welcome to Hangman Aqua!")

#Create blanks
display = []
for _ in range(word_length):
    display += "_"

while not end_game:
    guess = input("Guess a letter: ").lower()

    clear()

    if guess in display:
      print("You've already guessed", {guess})

    #Check guessed letter
    for position in range(word_length):
        letter = chosen_word[position]
        if letter == guess:
            display[position] = letter

    #Check if user is wrong.
    if guess not in chosen_word:

        print(f"You guessed {guess}, that's not in the word.The water is rising.")
        lives -= 1
        if lives == 0:
            end_game = True
            print("You lose. He drowned. ")
      
        
    
    #Join all the elements in the list and turn it into a String.
    print(f"{' '.join(display)}")

    #Check if user has got all letters.
    if "_" not in display:
        end_of_game = True
        print("You win.")

    print(stages[lives])
    if end_game:
      print(chosen_word)