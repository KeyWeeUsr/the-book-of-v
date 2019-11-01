fn count(mode Mode, path string) int {
    mut result := 0

    if !os.file_exists(path) {
        result = -1
        return result
    }

    content := os.read_file(path) or {return result}
    for item in content {
        if "" in mode.sep || item.str() in mode.sep {
            result++
        }
    }
    return result
}
