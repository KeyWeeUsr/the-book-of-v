fn load_word(path string) string {
    lines := os.read_lines(path)
    return lines[rand.next(lines.len)]
}
