import os

const (
    max_attempts = 6
)

fn game_loop() {
    mut attempts := 0
    guess_word := "hangman"
    display_word := "-".repeat(guess_word.len)
    mut user_input := ""

    for {
        attempts++
        println("Attempt $attempts")
        println("Word: [ $display_word ]")

        user_input = os.get_line()
        if user_input.len > 1 {
            println("Guessing a word: $user_input")
        } else if user_input.len == 1 {
            println("Guessing a character: $user_input")
        }

        if attempts >= max_attempts {
            break
        }
    }
}

fn main() {
    game_loop()
    println("Game over")
}
