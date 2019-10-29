import os


fn parse_mode(args []string) string {
    mut mode := ""
    words := ["-w", "--words"]
    lines := ["-l", "--lines"]
    chars := ["-c", "--chars"]

    if args[1] in words {
        mode = "words"
    } else if args[1] in lines {
        mode = "lines"
    } else if args[1] in chars {
        mode = "chars"
    }
    return mode
}


fn main() {
    mode := parse_mode(os.args)
    println("Mode: $mode")
}
