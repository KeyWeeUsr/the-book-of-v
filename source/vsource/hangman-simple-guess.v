import os

const (
    max_attempts = 6
)

fn game_loop() {
    mut attempts := 0
    guess_word := "hangman"
    mut display_word := "-".repeat(guess_word.len)
    mut user_input := ""

    for {
        attempts++
        println("Attempt $attempts")
        println("Word: [ $display_word ]")

        user_input = os.get_line()
        if user_input.len > 1 {
            println("Guessing a word: $user_input")
            if user_input == guess_word {
                display_word = guess_word
            }
        } else if user_input.len == 1 {
            println("Guessing a character: $user_input")
            mut buffer := ""
            for idx, value in guess_word {
                if value == display_word[idx] {
                    buffer += display_word[idx].str()
                    continue
                }

                if value != user_input[0] {
                    buffer += "-"
                    continue
                }

                buffer += guess_word[idx].str()
            }
            display_word = buffer
        }

        if display_word == guess_word {
            println("Correctly guessed!")
            break
        }

        if attempts >= max_attempts {
            println("Game over")
            break
        }
    }
}

fn main() {
    game_loop()
}
