struct Mode {
    name string
    cli_args []string
    sep string
}


const (
    words = Mode{name: "words", cli_args: ["-w", "--words"], sep: " "}
    lines = Mode{cli_args: ["-l", "--lines"], name: "lines", sep: "\n"}
    chars = Mode{name: "chars", cli_args: ["-c", "--chars"], sep: ""}
)
