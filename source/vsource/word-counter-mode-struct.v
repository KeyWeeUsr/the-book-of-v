import os

struct Mode {
    name string
    cli_args []string
}


fn parse_mode(args []string) Mode {
    mut mode := Mode{}
    words := Mode{name: "words", cli_args: ["-w", "--words"]}
    lines := Mode{name: "lines", cli_args: ["-l", "--lines"]}
    chars := Mode{name: "chars", cli_args: ["-c", "--chars"]}

    if args[1] in words.cli_args {
        mode = words
    } else if args[1] in lines.cli_args {
        mode = lines
    } else if args[1] in chars.cli_args {
        mode = chars
    }
    return mode
}


fn main() {
    mode := parse_mode(os.args)
    println("Mode: $mode.name")
}
