const (
    max_attempts = 6
)

fn game_loop() {
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
