fn check_win(word string, mask string) bool {
    return word == mask
}


fn check_continue(word string, mask string, attempts int) bool {
    return !check_win(word, mask) && attempts < max_attempts
}
