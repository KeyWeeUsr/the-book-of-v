import os

const (
    max_attempts = 6
)

fn guess(input string, word string, mask string) string {
    mut new_mask := mask

    if input.len > 1 && input == word {
        new_mask = word
    } else if input.len == 1 {
        mut buffer := ""

        for idx, value in word {
            if value == mask[idx] {
                buffer += mask[idx].str()
                continue
            }

            if value != input[0] {
                buffer += "-"
                continue
            }

            buffer += word[idx].str()
        }
        new_mask = buffer
    }
    return new_mask
}


fn check_win(word string, mask string) bool {
    return word == mask
}


fn check_continue(word string, mask string, attempts int) bool {
    return !check_win(word, mask) && attempts < max_attempts
}


fn print_summary(word string, mask string) {
    if check_win(word, mask) {
        println("Correctly guessed!")
    } else {
        println("Game over!")
    }
}


fn game_loop() {
    guess_word := "hangman"
    mut display_word := "-".repeat(guess_word.len)

    mut attempts := 0
    mut do_loop := true

    for do_loop {
        attempts++
        println("Attempt $attempts")
        println("Word: [ $display_word ]")

        display_word = guess(os.get_line(), guess_word, display_word)
        do_loop = check_continue(guess_word, display_word, attempts)
    }

    print_summary(guess_word, display_word)
}

fn main() {
    game_loop()
}
