fn game_loop() {
    max_attempts := 6
    mut attempts := 0
    for {
        attempts++
        println("User attempt $attempts")
        if attempts >= max_attempts {
            break
        }
    }
}

fn main() {
    game_loop()
    println("Game over")
}
